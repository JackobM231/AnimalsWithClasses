class List < Command
  ARGS_NUM = [1,2]

  def execute
    (@@args_length > 1) ? @@animal.list(@@animal.check_type(@@args[1])) : @@animal.list
    true
  end
end