require_relative 'app'

# display the menu options
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

# main method (entry point of the program)
def main
  app = App.new
  option = 0

  while option != 7
    display_menu
    option = gets.chomp.to_i

    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      puts "Thank you for using this app!"
    else
      puts "Invalid option"
    end
  end
end

# start the program
main