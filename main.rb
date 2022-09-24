Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file } 
Dir[File.join(__dir__, 'models/animals', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'models/commands', '*.rb')].each { |file| require file }


# def check_args(methods, method, num_of_args)
#   # Check number of arguments for insert method
#   methods[method].include?(num_of_args) ? true : false
# end


# def check_type(animal_type)
#   # Check animal_types and returns annimal_type from available animal_types or return false
#   if !animal_type.match?(/^dogs?$|^spiders?$|^chickens?$/i)
#     puts "Unknown animal type."
#     return false
#   end

#   Animal::TYPES.detect { |type| animal_type.include?(type)}
# end 

# methods = {
#   "list" => [1,2],
#   "sum" => [1,2],
#   "add" => [3],
#   "remove" => [2],
#   "exit" => [1]
# }

# zwierz = Animal.new
x = true

while x
  puts "Input instructions: "
  arr = gets.chomp.downcase.split(" ")
  # arr_length = arr.length
  
  # if arr_length < 1 or arr_length > 3
  #   # Wrong number of arguments.
  #   next puts "Invalid number of arguments"
  # end

  # method = arr[0]

  # if !methods.keys.include?(method)
  #   # Wrong method.
  #   next puts "Wrong method selected."
  # end

  # if !check_args(methods, method, arr_length)
  #   # Wrong number of arguments to method.
  #   next puts "Wrong number of arguments."
  # end

  Invoker.new(arr)
  x = Invoker.result()
  # puts Invoker.new(arr)
  # Add.new(arr)
  # Sum.new(arr)
  # zwierz.list

  # case method
  # when "list"
  #   (arr_length > 1) ? zwierz.list(check_type(arr[1])) : zwierz.list()
  # when "sum"
  #   (arr_length > 1) ? zwierz.sum(check_type(arr[1])) : zwierz.sum()
  # when "add"
  #   # animal_type = check_type(arr[1])
  #   # zwierz.add(animal_type, arr[2]) if animal_type
  # when "remove"
  #   zwierz.remove(arr[1])
  # when "exit"
  #   return false
  # end
end