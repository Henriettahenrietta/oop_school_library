# load required classes
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# TEST CLASSROOM & STUDENT
puts "--Classroom Test--"

# create classroom
classroom = Classroom.new("Math")

# create student
student = Student.new(16, nil, "Isange", true)

# add student to classroom
classroom.add_student(student)

# display classroom info
puts "Classroom label: #{classroom.label}"

puts "Students in classroom:"
classroom.students.each do |s|
  puts s.name
end


# TEST BOOK & RENTAL
puts "\n--Book Rental Test-- "

# create book
book = Book.new("Ruby Basics", "Mac Joel")

# create teacher
teacher = Teacher.new(35, "Math", "Mrs Benadette")

# create rental
rental = Rental.new("2026-03-12", teacher, book)

# display rental info
puts "Book: #{book.title}"
puts "Rented by: #{teacher.name}"
puts "Date: #{rental.date}"


# TEST DECORATOR PATTERN
puts "\n-- Decorator Test-- "

# create person
person = Person.new(22, "Henrietta Isange")

# capitalize the name
capitalized = CapitalizeDecorator.new(person)

# trim the name to 10 characters
trimmed = TrimmerDecorator.new(capitalized)

# display result
puts trimmed.correct_name