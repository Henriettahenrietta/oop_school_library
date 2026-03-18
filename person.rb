require_relative 'nameable'

# Person class inherits from Nameable
class Person < Nameable
  # attributes that can be read
  attr_reader :id, :name, :age, :rentals

  # attributes that can be modified
  attr_writer :name, :age

  # constructor
  def initialize(age, name = "Unknown", parent_permission = true)
    @id = rand(1..1000)        # generate random id
    @name = name               # person's name
    @age = age                 # person's age
    @parent_permission = parent_permission
    @rentals = []              # list of rentals for this person
  end

  # method from Nameable class
  def correct_name
    @name
  end

  # check if the person can use services
  def can_use_services?
    of_age? || @parent_permission
  end

  # create a rental for this person
  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  # check if age is 18 or above
  def of_age?
    @age >= 18
  end
end