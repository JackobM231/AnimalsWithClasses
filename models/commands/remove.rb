class Remove < Command
  ARGS_NUM = [2]

  def execute
    @@animal.remove(@@args[1])
    true
  end
end