require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []

    load_data   # load saved data when app starts
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
 
  #Menu
  def display_menu
    puts "\nChoose an option:"
    puts "1 - List books"
    puts "2 - List people"
    puts "3 - Create person"
    puts "4 - Create book"
    puts "5 - Create rental"
    puts "6 - List rentals"
    puts "7 - Exit"
  end

  def handle_option(option)
    case option
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7
      save_data   # save before exiting
      puts "Bye!"
    else
      puts "Invalid option"
    end
  end


  #List books
  def list_books
    if @books.empty?
      puts "No books found"
    else
      @books.each_with_index do |b, i|
        puts "#{i}) #{b.title} by #{b.author}"
      end
    end
  end

 
  # List people
  def list_people
    if @people.empty?
      puts "No people found"
    else
      @people.each_with_index do |p, i|
        puts "#{i}) [#{p.class}] #{p.name}, Age: #{p.age}, ID: #{p.id}"
      end
    end
  end

  # Create people
  def create_person
    print "Student (1) or Teacher (2): "
    choice = gets.chomp.to_i

    if choice == 1
      print "Age: "
      age = gets.chomp.to_i

      print "Name: "
      name = gets.chomp

      print "Parent permission (Y/N): "
      permission = gets.chomp.downcase == 'y'

      @people << Student.new(age, nil, name, permission)

    elsif choice == 2
      print "Age: "
      age = gets.chomp.to_i

      print "Name: "
      name = gets.chomp

      print "Specialization: "
      spec = gets.chomp

      @people << Teacher.new(age, spec, name)
    end

    puts "Person created"
  end

  # Create book
  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    @books << Book.new(title, author)

    puts "Book created"
  end

  
  #Create rental
  def create_rental
    puts "Select book:"
    list_books
    book_index = gets.chomp.to_i

    puts "Select person:"
    list_people
    person_index = gets.chomp.to_i

    print "Date: "
    date = gets.chomp

    @rentals << Rental.new(date, @people[person_index], @books[book_index])

    puts "Rental created"
  end


  #List rentals
  def list_rentals
    print "Enter person ID: "
    id = gets.chomp.to_i

    @rentals.each do |r|
      if r.person.id == id
        puts "Date: #{r.date}, Book: #{r.book.title}"
      end
    end
  end

 
  # Sav data
  def save_data
    save_books
    save_people
    save_rentals
  end

  def save_books
    data = @books.map { |b| { title: b.title, author: b.author } }

    File.write('data/books.json', JSON.pretty_generate(data))
  end

  def save_people
    data = @people.map do |p|
      if p.is_a?(Student)
        { type: 'Student', age: p.age, name: p.name, parent_permission: true }
      else
        { type: 'Teacher', age: p.age, name: p.name, specialization: p.specialization }
      end
    end

    File.write('data/people.json', JSON.pretty_generate(data))
  end

  def save_rentals
    data = @rentals.map do |r|
      { date: r.date, book: r.book.title, person_id: r.person.id }
    end

    File.write('data/rentals.json', JSON.pretty_generate(data))
  end

 
  # Load data
  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    return unless File.exist?('data/books.json')

    JSON.parse(File.read('data/books.json')).each do |b|
      @books << Book.new(b['title'], b['author'])
    end
  end

  def load_people
    return unless File.exist?('data/people.json')

    JSON.parse(File.read('data/people.json')).each do |p|
      if p['type'] == 'Student'
        @people << Student.new(p['age'], nil, p['name'], p['parent_permission'])
      else
        @people << Teacher.new(p['age'], p['specialization'], p['name'])
      end
    end
  end

  def load_rentals
    return unless File.exist?('data/rentals.json')

    JSON.parse(File.read('data/rentals.json')).each do |r|
      book = @books.find { |b| b.title == r['book'] }
      person = @people.find { |p| p.id == r['person_id'] }

      @rentals << Rental.new(r['date'], person, book) if book && person
    end
  end
end