require_relative "./animal.rb"

module Animals
  class Spider < Animal
    LEGS_NO = 8

    def initialize(name)
      super name
    end
  end
end