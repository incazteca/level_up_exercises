class Dinosaur
    attr_accessor :name
    attr_accessor :period
    attr_accessor :contintent
    attr_accessor :diet
    attr_accessor :weight
    attr_accessor :walking
    attr_accessor :description

    def initialize (params)
        @name = params[:name]
        @period = params[:period]
        @continent = params[:continent]
        @diet = params[:diet]
        @weight = params[:weight]
        @walking = params[:walking]
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

        if @period.index('Cretaceous') != 0
            period_name = @period
        end
        if @period.index('Jurassic') != 0
            period_name = @period
        end
        if @period.index('Triassic') != 0
            period_name = @period
        end

        period_name
    end

    def print
        line = ""

        if (@name != nil)
            line.concat(@name.concat(" | "))
        end
        if (@period != nil)
            line.concat(@period.concat(" | "))
        end
        if (@continent!= nil)
            line.concat(@continent.concat(" | "))
        end
        if (@diet != nil)
            line.concat(@diet.concat(" | "))
        end
        if (@weight!= nil)
            line.concat(@weight.concat(" | "))
        end
        if (@walking != nil)
            line.concat(@walking.concat(" | "))
        end
        if (@description != nil)
            line.concat(@description.concat(" | "))
        end

        puts line
    end
end
