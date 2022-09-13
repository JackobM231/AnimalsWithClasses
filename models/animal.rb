class Animal
  attr_accessor :name, :num_of_legs, :time_of_creation, :type

  @@collection = []
  @@collection_names = []

  def initialize(name="", num_of_legs = 0)
    @name = name.capitalize
    @num_of_legs = num_of_legs
    @time_of_creation = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    @type = self.class.name.downcase
  end

  def display(object)
    # Formated message with object
    puts ("#{object.type}, #{object.name}, #{object.num_of_legs}, #{object.time_of_creation}")
  end

  # def to_collection(object)
  #   # Append current object to Animal class collection
  #   if !@@collection_names.include?(object.name)
  #     @@collection_names.push(object.name)
  #     @@collection.push(object)
  #     return true
  #   else
  #     return false
  #   end
  # end

  def to_collection(object)
    # Append current object to Animal class collection
    return false if @@collection_names.include?(object.name)

    @@collection_names.push(object.name)
    @@collection.push(object)
    return true
  end

  # def list(animal_type='all')
  #   # Nicely lists all animals of that type (all if not provided)
  #   animal_type = animal_type
  #   case animal_type
  #   when 'all'
  #     for element in @@collection
  #       display(element)
  #     end
  #   else
  #     for element in @@collection
  #       if element.type == animal_type
  #         display(element)
  #       end
  #     end
  #   end
  # end

  def list(animal_type='all')
    # Nicely lists all animals of that type (all if not provided)
    case animal_type
    when 'all'
      @@collection.each { |element| display(element) }
    else
      @@collection.each do |element|
        display(element) if element.type == animal_type
      end
    end
  end

  # def sum(animal_type="all")
  #   # Sums all legs of animals of that type and display them
  #   sum = 0
  #   case animal_type
  #   when 'all'
  #     for element in @@collection
  #       display(element)
  #       sum += element.num_of_legs
  #     end
  #     puts "Sum of #{animal_type} legs equals #{sum}."
  #   else
  #     for element in @@collection
  #       if element.type == animal_type
  #         display(element)
  #         sum += element.num_of_legs
  #       end
  #     end
  #     if sum == 0
  #       puts "There is no this type of animals in collection."
  #     else
  #       puts "Sum of #{animal_type}s legs equals #{sum}."
  #     end
  #   end
  # end

  def sum(animal_type="all")
    # Sums all legs of animals of that type and display them
    sum = 0

    case animal_type
    when 'all'
      @@collection.each do |element|
        display(element)
        sum += element.num_of_legs
      end
      return puts "Sum of #{animal_type} legs equals #{sum}."
    else
      @@collection.each do |element|
        if element.type == animal_type
          display(element)
          sum += element.num_of_legs
        end
      end
      answer_sum = "Sum of #{animal_type} legs equals #{sum}."
      answer_no_type = "There is no this type of animals in collection."
      response = sum == 0 ? answer_no_type : answer_sum
      return puts response
    end
  end

  # def add(animal_type="none", animal_name="none")
  #   # Creates a new animal of that type, outputs a message depending on the success
  #   if animal_type == "none" or animal_name == "none"
  #     puts "Error. Please use right arguments."
  #   else
  #     success = "#{animal_type.capitalize} created!"
  #     new_class = Object.const_get(animal_type.capitalize)
  #     new_animal = new_class.new(animal_name)
  #     unless to_collection(new_animal)
  #       return puts "Name of animal is taken."
  #     end
  #     puts success
  #   end
  # end

  def add(animal_type="none", animal_name="none")
    # Creates a new animal of that type, outputs a message depending on the success
    new_class = Object.const_get(animal_type.capitalize)
    new_animal = new_class.new(animal_name)
    unless to_collection(new_animal)
      return puts "Name of animal is taken."
    end
    puts "#{animal_type.capitalize} created!"
  end

  # def remove(animal_name="none")
  #   # Removes the said animal from collection and outputs a message depanding on the success
  #   if animal_name == "none"
  #     puts "Error. Please use right arguments."
  #   else
  #     i = 0
  #     for element in @@collection
  #       if element.name.downcase == animal_name.downcase
  #         @@collection.delete(element)
  #         i += 1
  #       end
  #     end
  #     if i > 0
  #       puts "Removing success!"
  #     else
  #       puts "Removing fail!"
  #     end
  #   end
  # end

  def remove(animal_name="")
    # Removes the said animal from collection and outputs a message depanding on the success
    if animal_name == ""
      return puts "Error. Please use name of animal to remove."
    end
    @@collection.each do |element|
      if element.name.downcase == animal_name.downcase
        @@collection.delete(element)
        @@collection_names.delete(element.name)
        return puts "Removing success!"
      end
    end
    return puts "Removing fail no animal with this name to remove!"
  end

end