require_relative "./invoker.rb"

loop do
  puts "Input instructions: "

  attrs = gets.chomp.split(" ")
  break if attrs.first.downcase == "exit"
 
  Invoker.invoke(attrs)
end