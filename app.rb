require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

# App class manages all user actions
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # LIST ALL BOOKS
  def list_books
    if @books.empty?
      puts "No books found."
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  # LIST ALL PEOPLE
def list_people
    if @people.empty?
      puts "No people found."
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
      end
    end
  end


  # CREATE PERSON
  def create_person
    print "Do you want to create a student (1) or a teacher (2)? "
    choice = gets.chomp.to_i

    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "Invalid option"
    end
  end

  # create student
  def create_student
    print "Age: "
    age = gets.chomp.to_i

    print "Name: "
    name = gets.chomp

    print "Has parent permission? [Y/N]: "
    permission = gets.chomp.downcase == 'y'

    student = Student.new(age, nil, name, permission)
    @people << student

    puts "Student created successfully."
  end

  # create teacher
  def create_teacher
    print "Age: "
    age = gets.chomp.to_i

    print "Name: "
    name = gets.chomp

    print "Specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people << teacher

    puts "Teacher created successfully."
  end

  # CREATE BOOK
  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts "Book created successfully."
  end

  # CREATE RENTAL
  def create_rental
    puts "Select a book by number"
    list_books
    book_index = gets.chomp.to_i

    puts "Select a person by number"
    list_people
    person_index = gets.chomp.to_i

    print "Date: "
    date = gets.chomp

    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals << rental

    puts "Rental created successfully."
  end

  
  # LIST RENTALS BY PERSON ID
  def list_rentals
    print "Enter person ID: "
    id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == id }

    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end