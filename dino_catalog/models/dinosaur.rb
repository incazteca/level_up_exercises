class Dinosaur
  attr_accessor :name
  attr_accessor :period
  attr_accessor :contintent
  attr_accessor :diet
  attr_accessor :weight
  attr_accessor :walking
  attr_accessor :description

  def initialize (params)
    @name        = params[:name] || params[:genus]
    @period      = params[:period]
    @continent   = params[:continent]
    @diet        = params[:diet]
    @weight      = params[:weight]
    @walking     = params[:walking]
    @description = params[:description]
  end

  def carnivore?
    ["Carnivore", "Insectivore", "Piscivore", "Yes"].include?(@diet)
  end

  def period?(search_string)
    @period.include?(search_string)
  end

end
