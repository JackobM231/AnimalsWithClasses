class Animal
  LEGS_NO = nil

  Dir[File.join(__dir__, '*.rb')].each { |file| require file } 

  TYPES = {
    /^dogs?$/i => Animals::Dog,
    /^spiders?$/i => Animals::Spider,  
    /^chickens?$/i => Animals::Chicken
  }
  @@cache = []

  attr_reader :name, :created_at, :type

  def initialize(name)
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

    def all
      @@cache
    end

    def list(animal_type)
      return all.each { |el| el.display } if !animal_type
      all.filter_map { |animal| animal.display if animal.type == animal_type }
    end

    def sum(animal_type)
      if !animal_type
        s = all.map { |animal| animal.num_of_legs}.sum
        puts "Sum of all animals legs equals #{s}."
      else
        s = all.filter_map { |animal| animal.num_of_legs if animal.type == animal_type}.sum
        puts "Sum of #{animal_type} legs equals #{s}."
      end
    end

    def remove(animal_name="")
      success = "Removing success!"
      failure = "Removing fail no animal with this name to remove!"
      
      all.filter_map { |animal| all.delete(animal) if animal.name == animal_name}.any? ? puts(success) : puts(failure)
    end

  end
end
