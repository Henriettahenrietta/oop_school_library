require_relative "student"
require_relative "teacher"

student = Student.new(16, "Math", "Alice", true)
teacher = Teacher.new(40, "Mathematics", "Mr. Smith")

puts "Student name: #{student.name}"
puts "Student can use services?: #{student.can_use_services?}"
puts student.play_hooky

puts "Teacher name: #{teacher.name}"
puts "Teacher specialization: #{teacher.specialization}"
puts "Teacher can use services?: #{teacher.can_use_services?}"
