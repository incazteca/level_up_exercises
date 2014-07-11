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
        dino_ar.push(dino) if dino_match_filter?(dino,options.to_h)
      end
    end

    dino_ar
  end

  def dino_match_filter?(dino, opt_hash)
    if opt_hash[:name]
      return unless name_match_filter?(dino, opt_hash[:name])
    end

    if opt_hash[:diet]
      return unless diet_match_filter?(dino, opt_hash[:diet])
    end

    if opt_hash[:period]
      return unless period_match_filter?(dino, opt_hash[:period])
    end

    if opt_hash[:walking_type]
      return unless walk_match_filter?(dino, opt_hash[:walking_type])
    end

    if opt_hash[:weight]
      return unless weight_match_filter?(dino, opt_hash[:weight])
    end

    true
  end

  def name_match_filter?(dino, value)
    dino.name == value
  end

  def diet_match_filter?(dino, value)
    value == :carnivore ? dino.carnivore? : !dino.carnivore?
  end

  def period_match_filter?(dino, value)
    dino.period?(value)
  end

  def walk_match_filter?(dino, value)
    value == :biped ? dino.biped? : dino.quadriped?
  end

  def weight_match_filter?(dino, value)

    return false unless dino.weight

    if value.include? "+"
      dino.weight.to_i > value[1..-1].to_i
    elsif value.include? "-"
      dino.weight.to_i < value[1..-1].to_i
    else
      dino.weight.to_i == value.to_i
    end
  end
end

