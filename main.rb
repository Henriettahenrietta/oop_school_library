require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

puts "---- Student and Teacher Test ----"

student = Student.new(16, "Math", "Henrietta", true)
teacher = Teacher.new(40, "Mathematics", "Mrs. Benadette")

puts "Student name: #{student.name}"
puts "Student can use services?: #{student.can_use_services?}"
puts student.play_hooky

puts "Teacher name: #{teacher.name}"
puts "Teacher specialization: #{teacher.specialization}"
puts "Teacher can use services?: #{teacher.can_use_services?}"

puts "\nDecorator Test"

person = Person.new(22, "Henrietta Isange")

puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name