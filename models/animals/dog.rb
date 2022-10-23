require_relative "../animal.rb"

module Animals
  class Dog < Animal
    LEGS_NO = 4

    def initialize(name)
      super name
    end
  end
end