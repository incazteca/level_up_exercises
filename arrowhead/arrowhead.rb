class Arrowhead
  # This seriously belongs in a database.
  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody",
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow",
    },
  }

  def self.classify(region, shape)
    get_arrowhead(get_shapes(region), shape)
  end

  def self.get_shapes(region)
    raise "Unknown region, please provide a valid region." unless CLASSIFICATIONS.include?(region)

    CLASSIFICATIONS[region]
  end

  def self.get_arrowhead(shapes, shape)
    raise "Unknown shape value. Are you sure you know what you're talking about?" unless shapes.include?(shape)

    puts "You have a(n) '#{shapes[shape]}' arrowhead. Probably priceless."
  end
end

puts Arrowhead.classify(:northern_plains, :bifurcated)

