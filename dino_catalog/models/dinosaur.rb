class Dinosaur
  attr_accessor :name
  attr_accessor :period
  attr_accessor :contintent
  attr_accessor :diet
  attr_accessor :weight
  attr_accessor :walking
  attr_accessor :description

  def initialize (params)
    @name        = params[:name]
    @period      = params[:period]
    @continent   = params[:continent]
    @diet        = params[:diet]
    @weight      = params[:weight]
    @walking     = params[:walking]
    @description = params[:description]
  end

  def is_carnivore
    carnivorous = false

    case @diet
    when "Carnivore", "Insectivore", "Piscivore", "Yes"
      carnivorous = true
    end

    carnivorous
  end

  def period
    period_name = ""

    period_name = @period if @period.index('Cretaceous') != 0
    period_name = @period if @period.index('Jurassic')   != 0
    period_name = @period if @period.index('Triassic')   != 0

    period_name
  end

  def print
    line = ""

    line.concat(@name.concat(" | "))        if (@name != nil)
    line.concat(@period.concat(" | "))      if (@period != nil)
    line.concat(@continent.concat(" | "))   if (@continent != nil)
    line.concat(@diet.concat(" | "))        if (@diet!= nil)
    line.concat(@weight.concat(" | "))      if (@weight != nil)
    line.concat(@walking.concat(" | "))     if (@walking != nil)
    line.concat(@description.concat(" | ")) if (@description != nil)
    line.concat(@name.concat(" | "))        if (@name != nil)

    puts line
  end
end
