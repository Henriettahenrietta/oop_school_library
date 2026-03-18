#File to coordianate actions
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  #Main loop
  def run
    option = 0

    while option != 7
      display_menu
      option = gets.chomp.to_i
      handle_option(option)
    end
  end

  #Menu display
  def display_menu
    puts
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
  end

  #Handles user choice
  def handle_option(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts "Thank you for using this app!"
    else
      puts "Invalid option"
    end
  end

  #List books
  
  def list_books
    if @books.empty?
      puts "No books available."
    else
      @books.each { |b| puts "Title: #{b.title}, Author: #{b.author}" }
    end
  end

  # List people
  def list_people
    if @people.empty?
      puts "No people available."
    else
      @people.each do |p|
        puts "[#{p.class}] Name: #{p.name}, Age: #{p.age}, ID: #{p.id}"
      end
    end
  end

  # Create people
  def create_person
    print "Student (1) or Teacher (2)? "
    choice = gets.chomp.to_i

    case choice
    when 1 then create_student
    when 2 then create_teacher
    else puts "Invalid choice"
    end
  end

  def create_student
    print "Age: "
    age = gets.chomp.to_i

    print "Name: "
    name = gets.chomp

    print "Parent permission (Y/N): "
    permission = gets.chomp.downcase == 'y'

    @people << Student.new(age, nil, name, permission)

    puts "Student created successfully."
  end

  def create_teacher
    print "Age: "
    age = gets.chomp.to_i

    print "Name: "
    name = gets.chomp

    print "Specialization: "
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)

    puts "Teacher created successfully."
  end

  
  # Create book
  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    @books << Book.new(title, author)

    puts "Book created successfully."
  end

  # Create rental
  def create_rental
    puts "Select a book:"
    list_books
    book_index = gets.chomp.to_i

    puts "Select a person:"
    list_people
    person_index = gets.chomp.to_i

    print "Date: "
    date = gets.chomp

    @rentals << Rental.new(date, @people[person_index], @books[book_index])

    puts "Rental created successfully."
  end


  # List rentals
  def list_rentals
    print "Enter person ID: "
    id = gets.chomp.to_i

    rentals = @rentals.select { |r| r.person.id == id }

    rentals.each do |r|
      puts "Date: #{r.date}, Book: #{r.book.title}"
    end
  end
end