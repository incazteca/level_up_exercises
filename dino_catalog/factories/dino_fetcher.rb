require_relative 'csv_parser.rb'
require_relative '../models/dinosaur.rb'

class DinoFetcher
  attr_accessor :file_paths

  def initialize (file_paths)
    @file_paths = file_paths
  end

  def get_dinosaurs(options)
    dino_ar = Array.new
    @file_paths.each do |file|
      CSVParser.new(file).to_arr_of_hash.each do |elem|
        dino = Dinosaur.new(elem)
        match_flag = true

        options.each_pair do |struct_key, value|

          match_flag = false if struct_key == :name && dino.name != value

          if struct_key == :diet
            match_flag = false if dino.carnivore? == true && value == 'herbivore'
            match_flag = false if dino.carnivore? == false && value == 'carnivore'
          end

          match_flag = false if struct_key == :period && dino.period != value

          if struct_key == :walk
            match_flag = false if dino.bipedal? == true && value == 'quadriped'
            match_flag = false if dino.quadriped? == false && value == 'biped'
          end

          if struct_key == :size
            if value.include? "+"
              value[0] = ''
              match_flag = false if dino.weight < value
            elsif value.include? "-"
              value[0] = ''
              match_flag = false if dino.weight > value
            else
              match_flag = false if dino.weight != value
            end
          end

        end
        dino_ar.push(dino) if match_flag
      end
    end

    dino_ar
  end

end
