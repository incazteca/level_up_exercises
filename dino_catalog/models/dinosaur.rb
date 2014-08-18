class Dinosaur
  attr_accessor :name, :period, :contintent, :diet, :weight, :walking_type, :description

  def initialize (params)
    @name         = params[:name] || params[:genus]
    @period       = params[:period]
    @continent    = params[:continent]
    @diet         = params[:diet] || diet_parser(params)
    @weight       = params[:weight_in_lbs] || params[:weight]
    @walking_type = params[:walking]
    @description  = params[:description] || nil
  end

  def carnivore?
    ["Carnivore", "Insectivore", "Piscivore"].include?(@diet)
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

  def inspect
    dino_str = ''
    self.instance_variables.map do |v|
      dino_str << "|#{self.instance_variable_get(v)}"
    end
    puts dino_str
  end

  private

  def diet_parser(params)
    if params[:carnivore] == 'Yes'
      "Carnivore"
    elsif params[:carnivore] == 'No'
      "Herbivore"
    elsif params[:herbivore] == 'Yes'
      "Herbivore"
    elsif params[:herbivore] == 'No'
      "Carnivore"
    end
  end
end

