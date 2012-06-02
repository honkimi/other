class Roulette
  def method_missing(name, *arg)
    person = name.to_s.capitalize
    super unless %w[Bob Flank Bill].include? person
    3.times do
      number =  rand(10)+1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank

