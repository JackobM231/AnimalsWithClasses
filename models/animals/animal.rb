
class Animal
  LEGS_NO = nil
  # TYPES.detect { |k, v| k.match? name }&[1] if nil --> resuce KeyError nie zwroci Ci, tylko zwroci Ci nil albo wyjeb & i obsluz blad

  Dir[File.join(__dir__, '*.rb')].each { |file| require file } 

  TYPES = {
    /^dogs?$/i => Animals::Dog,
    /^spiders?$/i => Animals::Spider,  
    /^chickens?$/i => Animals::Chicken
  }


  # @@cache = [] # { "DOGS"=> [obj1, obj2] }
  @@cache = [] # [obj1, obj2]

  attr_reader :name, :created_at, :type

  def initialize(name) # Ewentualnie usunąć type
    @name = name.capitalize
    @created_at = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    @type = self.class.name.split("::").last.downcase
  end

  def save
    @@cache.push(self)
  end

  def num_of_legs
    self.class::LEGS_NO
  end

  def display
    puts ("#{self.type}, #{self.name}, #{self.num_of_legs}, #{self.created_at}")
  end

  class << self
    def create!(name)
      if all.detect { |el| el.name == name}
        raise StandardError, "Animal name is alread taken."
      else
        new(name).save
      end
    end

    # def create!(**args)
    #   puts "CREATE!"
    #   if self.all.pluck(:name).include? name
    #     raise StandardError, "Animal name is alread taken."
    #   else
    #     new(**args).save
    #   end
    # end

    def all
      @@cache
    end

    # Formated message with object
    # Przerob to
    # def display(object)
    #   puts ("#{object.type}, #{object.name}, #{object.num_of_legs}, #{object.created_at}")
    # end


    # Check animal_types and returns annimal_type from available animal_types or return false
    # def check_type(animal_type)
    #   if !animal_type.match?(/^dogs?$|^spiders?$|^chickens?$/i)

    #     puts "Unknown animal type."
    #     return false
    #   end
    #   Animal::TYPES.detect { |type| animal_type.include?(type)}
    # end 

    # Nicely lists all animals of that type (all if not provided)
    def list(animal_type)
      return all.each { |el| el.display } if !animal_type

      all.filter_map { |animal| animal.display if animal.type == animal_type }
    end
      # return all.each(&:display) if !animal_type

      # all.detect { |animal| animal.type == animal_type }


    # def list(animal_type="all")
    #   return self.all.each(&:display) if animal_type == "all"

    #   self.all.detect { |animal| animal.type == animal_type }

      # case animal_type
      # when 'all'
      #   @@collection.each { |element| display(element) }
      # else
        # @@collection.each do |element|
        #   display(element) if element.type == animal_type
        # end
      # end
    # end

    # Sums all legs of animals of that type and display them
    def sum(animal_type)

      # Obczaj sobie metodke reduce [1,2,3,4].reduce(&:+) albo map i sum
      if !animal_type
        s = all.map { |animal| animal.num_of_legs}.sum
        puts "Sum of all animals legs equals #{s}."
      else
        s = all.filter_map { |animal| animal.num_of_legs if animal.type == animal_type}.sum
        puts "Sum of #{animal_type} legs equals #{s}."
      end

      # !animal_type ? s = all.map { |animal| animal.num_of_legs}.sum : s = all.filter_map { |animal| animal.num_of_legs if animal.type == animal_type}.sum

      # specific = "Sum of #{animal_type} legs equals #{s}."""
      # many = "Sum of all animals legs equals #{s}"
      
      # !animal_type ? puts(specific) : puts(many)
      
      
      # return all.map { |animal| animal.num_of_legs}.sum if !animal_type
      # all.filter_map { |animal| animal.num_of_legs if animal.type == animal_type}.sum

      
      # sum = 0
      # case animal_type
      # when 'all'
      #   @@collection.each do |element|
      #     display(element) # element.display
      #     sum += element.num_of_legs
      #   end

      #   puts "Sum of #{animal_type} legs equals #{sum}."
      # else
      #   @@collection.each do |element|
      #     if element.type == animal_type
      #       display(element)
      #       sum += element.num_of_legs
      #     end
      #   end

      #   answer_sum = "Sum of #{animal_type} legs equals #{sum}."
      #   answer_no_type = "There is no this type of animals in collection."
      #   response = sum == 0 ? answer_no_type : answer_sum

      #   Animal.where(type: type).count(:legs)

      #   puts response
      # end
    end
    # def sum(animal_type="all")

    #   # Obczaj sobie metodke reduce [1,2,3,4].reduce(&:+) albo map i sum
    #   sum = 0
    #   case animal_type
    #   when 'all'
    #     @@collection.each do |element|
    #       display(element) # element.display
    #       sum += element.num_of_legs
    #     end

    #     puts "Sum of #{animal_type} legs equals #{sum}."
    #   else
    #     @@collection.each do |element|
    #       if element.type == animal_type
    #         display(element)
    #         sum += element.num_of_legs
    #       end
    #     end

    #     answer_sum = "Sum of #{animal_type} legs equals #{sum}."
    #     answer_no_type = "There is no this type of animals in collection."
    #     response = sum == 0 ? answer_no_type : answer_sum

    #     Animal.where(type: type).count(:legs)

    #     puts response
    #   end
    # end

    # Creates a new animal of that type, outputs a message depending on the success
    # def add(animal_type="none", animal_name="none")
    #   new_class = Object.const_get(animal_type.capitalize)
    #   new_animal = new_class.new(animal_name)

    #   unless to_collection(new_animal)
    #     return puts "Name of animal is taken."
    #   end

    #   puts "#{animal_type.capitalize} created!"
    # end

    # Removes the said animal from collection and outputs a message depanding on the success
    # def remove(animal_name="")
    #   if animal_name == ""

    #     return puts "Error. Please use name of animal to remove."
    #   end
    #   @@collection.each do |element|
    #     if element.name.downcase == animal_name.downcase

    #       @@collection.delete(element)
    #       @@collection_names.delete(element.name)
    #       return puts "Removing success!"
    #     end
    #   end
    #   return puts "Removing fail no animal with this name to remove!"
    # end

    def remove(animal_name="")
      
      success = "Removing success!"
      failure = "Removing fail no animal with this name to remove!"

      all.filter_map { |animal| all.delete(animal) if animal.name == animal_name}.any? ? puts(success) : puts(failure)
    end

  end

end
