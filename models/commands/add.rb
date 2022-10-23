require_relative "./command.rb"

module Commands
  class Add < Command
    ARGS_NUM = [2]

    def execute
      return klass.create!(animal_name) if valid?
      puts error_messages
    rescue StandardError => e
      puts e.message
    end
  
    def valid?
      error_messages.push("Wrong number of arguments.") if !ARGS_NUM.include? args.size
      error_messages.empty?
    end

    def error_messages
      @error_messages ||= []
    end
    
    def animal_type
      @animal_type ||= args.first
    end

    def animal_name
      @animal_name ||= args[1].capitalize
    end

    def klass
      Animal::TYPES.detect { |k, v| animal_type.match? k}[1]
    rescue NoMethodError
      puts "Animal type not supported."
    end
    
  end
end
