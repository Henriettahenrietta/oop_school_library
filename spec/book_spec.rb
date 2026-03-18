require_relative '../book'

describe Book do
  before :each do
    @book = Book.new("Ruby", "John")
  end

  it "has a title" do
    expect(@book.title).to eq("Ruby")
  end

  it "has an author" do
    expect(@book.author).to eq("John")
  end

  it "starts with empty rentals" do
    expect(@book.rentals).to be_empty
  end
end