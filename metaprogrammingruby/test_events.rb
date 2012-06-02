
setup do
  puts "setup"
  @a = 10
end

event "event happen" do
  @a < 15
end

event "event not happen" do
  @a > 20
end

