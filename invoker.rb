Dir[File.join(__dir__, 'models/commands', '*.rb')].each { |file| require file } 

class Invoker
  COMMANDS = {
    "add" => Commands::Add,
    "list" => Commands::List,
    "remove" => Commands::Remove,
    "sum" => Commands::Sum
  }.freeze
  private_constant :COMMANDS

  attr_reader :attrs

  def initialize(attrs)
    @attrs = attrs
  end

  def self.invoke(attrs)
    new(attrs).invoke
  end

  def invoke
    command.new(cmd_args).execute
  end

  private

  def cmd_args
    @cmd_args ||= attrs.slice(1..-1)
  end

  def command
    @command ||= COMMANDS.fetch(@attrs.first)
  rescue KeyError
    puts "Command not found"
  end
  
end