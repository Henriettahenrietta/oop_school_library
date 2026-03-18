require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(20, "Alice")
  end

  it "returns correct name" do
    expect(@person.correct_name).to eq("Alice")
  end

  it "can use services if age >= 18" do
    expect(@person.can_use_services?).to be true
  end
end