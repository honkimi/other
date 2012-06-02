Kernel.send :define_method, :setup  do
end

def event name
  setup.call
  puts "ALERT: #{name}" if yield
end

Dir.glob('*events.rb').each{|file| load file}
