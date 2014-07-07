class Dinosaur
  attr_accessor :name
  attr_accessor :period
  attr_accessor :contintent
  attr_accessor :diet
  attr_accessor :weight
  attr_accessor :walking_type
  attr_accessor :description

  def initialize (params)
    @name         = params[:name] || params[:genus]
    @period       = params[:period]
    @continent    = params[:continent]
    @diet         = params[:diet] || params[:carnivore]
    @weight       = params[:weight_in_lbs] || params[:weight]
    @walking_type = params[:walking]
    @description  = params[:description] || nil
  end

  def carnivore?
    ["Carnivore", "Insectivore", "Piscivore", "Yes"].include?(@diet)
  end

  def period?(search_string)
    @period.include?(search_string)
  end

  def biped?
    @walking_type.include?("Biped")
  end

  def quadriped?
    @walking_type.include?("Quadriped")
  end
end
