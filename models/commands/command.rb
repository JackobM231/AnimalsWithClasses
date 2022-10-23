require_relative "../animals/animal.rb"

class Command
  ARGS_NUM = nil

  attr_reader :args

  def initialize(args)
    @args = args
  end

  def execute
    raise NotImplementedError, "Method #{__method__} not implemented."
  end

  def valid?
    raise NotImplementedError, "Method #{__method__} not implemented."
  end
end
