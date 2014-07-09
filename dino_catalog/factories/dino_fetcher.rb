require_relative 'csv_parser.rb'
require_relative '../models/dinosaur.rb'

class DinoFetcher
  attr_accessor :file_paths

  def initialize(file_paths)
    @file_paths = file_paths
  end

  def get_dinosaurs(options)
    dino_ar = Array.new

    @file_paths.each do |file|
      CSVParser.new(file).to_arr_of_hash.each do |elem|
        dino = Dinosaur.new(elem)

        next if !dino_match_filter?(dino,options.to_h)

        dino_ar.push(dino)
      end
    end

    dino_ar
  end

  def dino_match_filter?(dino, opt_hash)
    if opt_hash.has_key?(:name)
      return if !name_match_filter?(dino, opt_hash[:name])
    end

    if opt_hash.has_key?(:diet)
      return if !diet_match_filter?(dino, opt_hash[:diet])
    end

    if opt_hash.has_key?(:period)
      return if !period_match_filter?(dino, opt_hash[:period])
    end

    if opt_hash.has_key?(:walking_type)
      return if !walk_match_filter?(dino, opt_hash[:walking_type])
    end

    if opt_hash.has_key?(:weight)
      return if !weight_match_filter?(dino, opt_hash[:weight])
    end

    true
  end

  def name_match_filter?(dino, value)
    dino.name == value ? true : false
  end

  def diet_match_filter?(dino, value)
    filter_match = false
    filter_match = true if value.to_s == 'carnivore' && dino.carnivore?
    filter_match = true if value.to_s == 'herbivore' && !dino.carnivore?
    filter_match
  end

  def period_match_filter?(dino, value)
    dino.period?(value)
  end

  def walk_match_filter?(dino, value)
    filter_match = false
    filter_match = true if value.to_s == "biped" && dino.biped?
    filter_match = true if value.to_s == 'quadriped' && dino.quadriped?
    filter_match
  end

  def weight_match_filter?(dino, value)
    filter_match = false

    if dino.weight != nil
      if value.include? "+"
        filter_match = true if dino.weight.to_i > value[1..-1].to_i
      elsif value.include? "-"
        filter_match = true if dino.weight.to_i < value[1..-1].to_i
      else
        filter_match = true if dino.weight.to_i == value.to_i
      end
    end

    filter_match
  end
end

