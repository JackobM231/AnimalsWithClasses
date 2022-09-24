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
    if !@command
      return false
    end

    if !@command.validation(args)
      return false
    end

    @@result = @command.execute
  end

  def command(args)
    @command ||= COMMANDS.fetch(args[0].downcase).new
  rescue KeyError
    puts "Command not found"
  end

  def self.result
    @@result
  end
end