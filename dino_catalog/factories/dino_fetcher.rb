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
        dino_ar.push(dino) if dino_match_filter?(dino, options)
      end
    end

    dino_ar
  end

  def dino_match_filter?(dino, opt_hash)
    opt_hash.all? { |k, v| send("#{k.to_s}_match_filter?", dino, v) }
  end

  private

  def name_match_filter?(dino, value)
    dino.name == value
  end

  # TODO Refactor the user carnivore mapping to dinodex
  def diet_match_filter?(dino, value)
    value == :carnivore ? dino.carnivore? : !dino.carnivore?
  end

  def period_match_filter?(dino, value)
    dino.period?(value)
  end

  # TODO Refactor this as well
  def walking_type_match_filter?(dino, value)
    value == :biped ? dino.biped? : dino.quadriped?
  end

  def weight_more_match_filter?(dino, value)
    dino.weight.to_i > value if dino.weight
  end

  def weight_less_match_filter?(dino, value)
    dino.weight.to_i < value if dino.weight
  end

  def weight_match_filter?(dino, value)
    dino.weight.to_i == value if dino.weight
  end

end

