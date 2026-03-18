require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new("Math")
    @student = Student.new(16, nil, "Alice", true)
  end

  it "adds student to classroom" do
    @classroom.add_student(@student)
    expect(@classroom.students).to include(@student)
  end
end