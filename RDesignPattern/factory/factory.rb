# encoding: utf-8

class Habitat
  def initialize number_animals, number_plants, organism_factory
    @organism_factory = organism_factory

    @animals = []
    number_animals.times do |i|
      animal = @organism_factory.new_animal("動物#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = @organism_factory.new_plant("植物#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each{|plant| plant.grow}
    @animals.each{|animal|animal.speak}
    @animals.each{|animal|animal.eat}
    @animals.each{|animal|animal.sleep}
  end

  def new_organism(type, name)
    if type == :animal
      @animal_class.new(name)
    elsif type == :plant
      @plant_class.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end

class JungleOrganismFactory
  def new_animal name
    Tiger.new(name)
  end

  def new_plant name
    Tree.new(name)
  end
end


class Tree
  def initialize name
    @name = name
  end

  def grow
    puts "植木#{@name}が高く育ってるよ"
  end
end

class Tiger
  def initialize name
    @name = name
  end

  def eat
    puts "トラ#{@name}が食べてる"
  end

  def speak
    puts "トラ#{@name}がほえてる"
  end

  def sleep
    puts "トラ#{@name}がねてる"
  end
end
    

jungle = Habitat.new(1,4,JungleOrganismFactory.new)
jungle.simulate_one_day
