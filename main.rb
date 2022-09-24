Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file } 
Dir[File.join(__dir__, 'models/animals', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'models/commands', '*.rb')].each { |file| require file }

x = true

while x
  puts "Input instructions: "
  arr = gets.chomp.downcase.split(" ")

  Invoker.new(arr)
  x = Invoker.result()

end