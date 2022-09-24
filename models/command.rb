Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file } 
Dir[File.join(__dir__, 'models/animals', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'models/commands', '*.rb')].each { |file| require file }

class Command
  ARGS_NUM = nil
  @@animal = Animal.new

  attr_accessor :args

  def validation(args)
    @@args = args
    @@args_length = @@args.length

    # Wrong number of arguments.
    if @@args_length < 1 or @@args_length > 3
      puts "Invalid number of arguments"
      return false
    end

    method = @@args[0]
    command = Invoker::COMMANDS[method]

    # Wrong number of arguments for method.
    if !command::ARGS_NUM.include?(@@args_length)
      puts "Wrong number of arguments for this method."
      return false
    end
    method
  end
end