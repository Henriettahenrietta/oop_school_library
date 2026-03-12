require_relative 'person'

# Student class inherits from Person
class Student < Person
  # allow classroom to be read and modified
  attr_accessor :classroom

  # constructor
  def initialize(age, classroom = nil, name = "Unknown", parent_permission = true)
    # call the parent (Person) constructor
    super(age, name, parent_permission)

    # classroom the student belongs to
    @classroom = classroom
  end

  # method to assign classroom
  def classroom=(classroom)
    @classroom = classroom

    # add student to classroom's student list if not already added
    classroom.students << self unless classroom.students.include?(self)
  end

  # fun method required in the project
  def play_hooky
    "¯\\(ツ)/¯"
  end
end