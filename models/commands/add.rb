class Add < Command
  ARGS_NUM = [3]

  # def initialize(*args)
  #   super args
  #   args = @@args

  #   # if validation(args)
  #   #   @animal_type = @@animal.check_type(args[1])
  #   #   @@animal.add(@animal_type, args[2]) if @animal_type
  #   # end
  # end

  def execute
    @animal_type = @@animal.check_type(@@args[1])
    @@animal.add(@animal_type, @@args[2]) if @animal_type
    true
  end
end