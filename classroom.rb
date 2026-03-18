# Classroom class
# A classroom can have many students

class Classroom
  # allow reading and writing of label and students
  attr_accessor :label, :students

  # constructor method
  def initialize(label)
    @label = label       # name/label of the classroom
    @students = []       # array to store students
  end

  # method to add a student to the classroom
  def add_student(student)
    # add student to classroom unless already added
    @students << student unless @students.include?(student)

    # set the student's classroom to this classroom
    student.classroom = self
  end
end