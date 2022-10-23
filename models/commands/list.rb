require_relative "./command.rb"

module Commands
  class List < Command
    ARGS_NUM = [0, 1]

    def execute
      return Animal.list(animal_type) if valid?
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
