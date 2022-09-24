class Sum < Command
  ARGS_NUM = [1, 2]

  # def initialize(*args)
  #   super args
  #   args = @@args

  #   # if validation(args)
  #   #   (@@args_length > 1) ? @@animal.sum(@@animal.check_type(args[1])) : @@animal.sum()
  #   # end
  # end

  def execute
    (@@args_length > 1) ? @@animal.sum(@@animal.check_type(@@args[1])) : @@animal.sum()
    true
  end
end