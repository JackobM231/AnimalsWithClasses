require_relative "./command.rb"

module Commands
  class Remove < Command
    ARGS_NUM = [1]

    def execute
      return Animal.remove(animal_name) if valid?
      puts error_messages
    end

    def valid?
      error_messages.push("Wrong number of arguments.") if !ARGS_NUM.include? args.size
      error_messages.empty?
    end

    def error_messages
      @error_messages ||= []
    end

    def animal_name
      @animal_name ||= args[0].capitalize
    end

  end
end