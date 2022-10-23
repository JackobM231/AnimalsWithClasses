require_relative "./animal.rb"

module Animals
  class Chicken < Animal
    LEGS_NO = 2

    def initialize(name)
      super name
    end
  end
end