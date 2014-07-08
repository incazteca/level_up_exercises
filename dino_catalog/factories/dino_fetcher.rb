require_relative 'csv_parser.rb'
require_relative '../models/dinosaur.rb'

class DinoFetcher
  attr_accessor :file_paths

  def initialize(file_paths)
    @file_paths = file_paths
  end

  def get_dinosaurs(options)
    dino_ar = Array.new
    opt_hash = options.to_h

    @file_paths.each do |file|
      CSVParser.new(file).to_arr_of_hash.each do |elem|
        dino = Dinosaur.new(elem)

        if opt_hash.has_key?(:name)
          next if !name_match_crit?(dino, opt_hash[:name])
        end

        if opt_hash.has_key?(:diet)
          next if !diet_match_crit?(dino, opt_hash[:diet])
        end

        if opt_hash.has_key?(:period)
          next if !period_match_crit?(dino, opt_hash[:period])
        end

        if opt_hash.has_key?(:walking_type)
          next if !walk_match_crit?(dino, opt_hash[:walking_type])
        end

        if opt_hash.has_key?(:weight)
          next if !weight_match_crit?(dino, opt_hash[:weight])
        end

        dino_ar.push(dino)
      end
    end

    dino_ar
  end

  def name_match_crit?(dino, value)
    dino.name == value ? true : false
  end

  def diet_match_crit?(dino, value)
    crit_match = false
    crit_match = true if value.to_s == 'carnivore' && dino.carnivore?
    crit_match = true if value.to_s == 'herbivore' && !dino.carnivore?
    crit_match
  end

  def period_match_crit?(dino, value)
    dino.period?(value)
  end

  def walk_match_crit?(dino, value)
    crit_match = false
    crit_match = true if value.to_s == "biped" && dino.biped?
    crit_match = true if value.to_s == 'quadriped' && dino.quadriped?
    crit_match
  end

  def weight_match_crit?(dino, value)
    crit_match = false

    if dino.weight != nil
      if value.include? "+"
        crit_match = true if dino.weight.to_i > value[1..-1].to_i
      elsif value.include? "-"
        crit_match = true if dino.weight.to_i < value[1..-1].to_i
      else
        crit_match = true if dino.weight.to_i == value.to_i
      end
    end

    crit_match
  end
end

