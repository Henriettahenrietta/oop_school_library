require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(40, "Math", "Mr Smith")
  end

  it "has specialization" do
    expect(@teacher.specialization).to eq("Math")
  end

  it "can always use services" do
    expect(@teacher.can_use_services?).to be true
  end
end