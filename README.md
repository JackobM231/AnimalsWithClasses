# AnimalsWithClasses

First project with ruby. Where we can create animals thanks to class methods.
Base class is representing an animal and three child classes for Chicken, Dog and Spider. Each of them have:

- _name (provided on creation)_
- _number of legs_
- _time of creation_
  All those values are outside accessible, but not modifiable.

Upon creation of a new animal, the base class keeps track of all already created animals. They are accessible through a class method that, depending on the caller’s context and will return all animals of that type. If an animal with that name already exists, it won't be added to the collection.

Each of the animals have access to a method to display them as string. It is a nice, formatted message containing their type, name, number of legs and time of creation (as hours:minutes:seconds).

Main script with an infinite loop, allows the user to input the following commands {are optional}:

- **list {animal_type}** - nicely lists all animals of that type (all if not provided)
- **sum {animal_type}** - sums all legs of animals of that type and displays them
- **add animal_type animal_name** - creates a new animal of that type, outputs a message depending on the success
- **remove animal_name** - removes the said animal from the collection and outputs a message depending on the success
- **exit** - stop the process and close the application

Commands and animal types are case-insensitive, animal types allow pluralisation (dog, Dogs). In case the user provides an invalid command, he is notified about it.

The main file only contains the user input loop and logic regarding commands support. All code related to the animals is contained within the functionality of their classes.
