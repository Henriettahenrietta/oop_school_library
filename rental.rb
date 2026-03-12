# Rental class
# This connects a person and a book

class Rental
  # allow date, person and book to be accessed
  attr_accessor :date, :person, :book

  # constructor
  def initialize(date, person, book)
    @date = date       # rental date
    @person = person   # person renting the book
    @book = book       # book being rented

    # add this rental to the person's rentals list
    person.rentals << self

    # add this rental to the book's rentals list
    book.rentals << self
  end
end