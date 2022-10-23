# Dir[File.join(__dir__, '*.rb')].each { |file| require file } 
require_relative "./animal.rb"

module Animals
  class Dog < Animal
    LEGS_NO = 4

    def initialize(name)
      super name
    end
  end
end
 


# Customer --> customers

# Customer.find_by(id: 1) --> "SELECT customer WHERE customers.id = 1"