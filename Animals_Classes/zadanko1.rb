require_relative "zadanko1_classes.rb"

def check_args(methods, method, num_of_args)
  # Check number of arguments for insert method
  if methods[method].include?(num_of_args)
    return true
  else
    return false
  end
end

def check_type(animal_type)
  # Check animal_types and returns annimal_type from available animal_types or return false
  if animal_type.match?(/^dogs?$|^spiders?$|^chickens?$/i)
    animal_types = ["dog", "spider", "chicken"]
    for type in animal_types
      if animal_type.include?(type)
        return type
      end
    end
    puts "Unknown animal type."
    return false
  else
    puts "Unknown animal type."
    return false
  end
end

methods = {
  "list" => [1,2],
  "sum" => [1,2],
  "add" => [3],
  "remove" => [2],
  "exit" => [1]
}

zwierz = Animal.new

while true
  puts "Input instructions: "
  arr = gets.chomp().downcase.split(" ", 4)
  arr_length = arr.length

  if arr_length >= 1 and arr_length <= 3
    method = arr[0]

    if methods.keys.include?(method)
      if check_args(methods, method, arr_length)
        # Right number of arguments to method
        case method
        when "list"
          if arr_length > 1
            zwierz.list(check_type(arr[1]))
          else
            zwierz.list()
          end
        when "sum"
          if arr_length > 1
            zwierz.sum(check_type(arr[1]))
          else
            zwierz.sum()
          end
        when "add"
          animal_type = check_type(arr[1])
          if animal_type
            zwierz.add(animal_type, arr[2])
          end
        when "remove"
          zwierz.remove(arr[1])
        when "exit"
          return false
        end
      else
        puts "Wrong number of arguments."
      end
    else
      puts "Wrong method selected."
    end
  else
    puts "Invalid number of arguments"
  end
end