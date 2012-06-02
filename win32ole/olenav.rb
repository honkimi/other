require 'win32ole'

applications = {
  'ie' => 'InternetExplorer.Application',
  'outlook' => 'Outlook.Application',
  'excel' => 'Excel.Application',
  'word' => 'Word.Application'
}

app = WIN32OLE.new(applications[ARGV[0]]) if ARGV[0] && applications[ARGV[0]]
puts  app.ole_obj_help.to_s

begin
  method = app.ole_method_help(ARGV[1])
rescue
  puts app.ole_methods
  puts "-------\n\"#{ARGV[1]}\" method not found"
  exit
end

puts method.return_type
method.params.each do |param|
  str = ""
  str.concat "[in] " if param.input?
  str.concat "[out] " if param.output?
  str.concat "[optional] " if param.optional?
  str.concat "[retval] " if param.retval?
  str.concat param.name
  str.concat " = #{param.default}" if param.default
  str.concat " As #{param.ole_type}"
  puts str
end
