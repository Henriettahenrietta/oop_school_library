require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe "Decorators" do
  before :each do
    @person = Person.new(22, "maximilianus")
  end

  it "capitalizes name" do
    capitalized = CapitalizeDecorator.new(@person)
    expect(capitalized.correct_name).to eq("Maximilianus")
  end

  it "trims name to 10 characters" do
    capitalized = CapitalizeDecorator.new(@person)
    trimmed = TrimmerDecorator.new(capitalized)
    expect(trimmed.correct_name.length).to be <= 10
  end
end