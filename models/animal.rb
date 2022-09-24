class Animal
  LEGS_NO = nil
  TYPES = ["dog", "spider", "chicken"]
  @@collection = []
  @@collection_names = []

  attr_accessor :name, :time_of_creation, :type

  def initialize(name="")
    @name = name.capitalize
    @time_of_creation = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    @type = self.class.name.downcase
  end

  def num_of_legs
    self.class::LEGS_NO
  end

  # Formated message with object
  def display(object)
    puts ("#{object.type}, #{object.name}, #{object.num_of_legs}, #{object.time_of_creation}")
  end

  # Append current object to Animal class collection
  def to_collection(object)
    return false if @@collection_names.include?(object.name)

    @@collection_names.push(object.name)
    @@collection.push(object)
    return true
  end

  # Check animal_types and returns annimal_type from available animal_types or return false
  def check_type(animal_type)
    if !animal_type.match?(/^dogs?$|^spiders?$|^chickens?$/i)
      puts "Unknown animal type."
      return false
    end
  
    Animal::TYPES.detect { |type| animal_type.include?(type)}
  end 

  # Nicely lists all animals of that type (all if not provided)
  def list(animal_type='all')
    case animal_type
    when 'all'
      @@collection.each { |element| display(element) }
    else
      @@collection.each do |element|
        display(element) if element.type == animal_type
      end
    end
  end

  # Sums all legs of animals of that type and display them
  def sum(animal_type="all")
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

  # Creates a new animal of that type, outputs a message depending on the success
  def add(animal_type="none", animal_name="none")
    new_class = Object.const_get(animal_type.capitalize)
    new_animal = new_class.new(animal_name)
    unless to_collection(new_animal)
      return puts "Name of animal is taken."
    end
    puts "#{animal_type.capitalize} created!"
  end

  # Removes the said animal from collection and outputs a message depanding on the success
  def remove(animal_name="")
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