# Dir[File.join(__dir__, '.', 'invoker.rb')].each { |file| require file } 
require_relative "./invoker.rb"
# Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file } 
# Dir[File.join(__dir__, 'models/animals', '*.rb')].each { |file| require file }
# Dir[File.join(__dir__, 'models/commands', '*.rb')].each { |file| require file }


loop do
  puts "Input instructions: "

  attrs = gets.chomp.split(" ")
  break if attrs.first.downcase == "exit"
 
  Invoker.invoke(attrs)
end