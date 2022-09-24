class Sum < Command
  ARGS_NUM = [1, 2]

  def execute
    (@@args_length > 1) ? @@animal.sum(@@animal.check_type(@@args[1])) : @@animal.sum()
    true
  end
end