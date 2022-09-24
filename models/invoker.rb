require_relative './command.rb'
Dir[File.join(__dir__, 'commands', '*.rb')].each { |file| require file } 

class Invoker
  COMMANDS = {
    "add" => Add,
    "exit" => Exit,
    "list" => List,
    "remove" => Remove,
    "sum" => Sum
  }
  @@result = true

  attr_reader :args

  def initialize(args)
    @args = args
    command(@args)
    invoke(@args)
  end
  
  def invoke(args)
    return false if !@command

    return false if !@command.validation(args)

    @@result = @command.execute
  end

  def command(args)
    @command ||= COMMANDS.fetch(args[0]).new
  rescue KeyError
    puts "Command not found"
  end

  def self.result
    @@result
  end
end