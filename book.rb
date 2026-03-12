# Book class
# A book can have many rentals

class Book
  # allow title, author and rentals to be accessed
  attr_accessor :title, :author, :rentals

  # constructor
  def initialize(title, author)
    @title = title       # book title
    @author = author     # book author
    @rentals = []        # list of rentals for this book
  end

  # method to create a rental
  def add_rental(person, date)
    # create a new rental connecting this book and a person
    Rental.new(date, person, self)
  end
end