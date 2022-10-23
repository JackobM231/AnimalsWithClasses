require_relative "./command.rb"

module Commands
  class Sum < Command
    ARGS_NUM = [0, 1]

    # def execute
    #   (@@args_length > 1) ? Animal.sum(Animal.check_type(@@args[1])) : Animal.sum
    #   true
    # end

    def execute
      return Animal.sum(animal_type) if valid?
      # return (
      #   sum = Animal.sum(animal_type)
      #   puts "Sum of #{animal_type} legs equals #{sum}."
      #   ) if valid?
      puts error_messages
    end

    def valid?
      error_messages.push("Wrong number of arguments.") if !ARGS_NUM.include? args.size
      return true if animal_type == nil or !animal_type == false
      error_messages.push("Wrong type of animal.")
      error_messages.empty?
    end

    def error_messages
      @error_messages ||= []
    end

    def animal_type
      @animal_type ||= args.first
      get_animal_type if args.first != nil
    end

    def get_animal_type
      x = Animal::TYPES.detect { |k, v| @animal_type.match? k}
      x ? x[1].name.split("::").last.downcase : false
    end

  end
end
