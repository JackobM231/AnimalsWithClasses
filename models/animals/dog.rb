class Dog < Animal
  def initialize(name)
    super name, num_of_legs = 4
  end
end