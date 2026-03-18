require_relative '../student'

describe Student do
  before :each do
    @student = Student.new(16, nil, "Bob", true)
  end

  it "inherits name" do
    expect(@student.name).to eq("Bob")
  end

  it "can play hooky" do
    expect(@student.play_hooky).to eq("¯\\(ツ)/¯")
  end
end