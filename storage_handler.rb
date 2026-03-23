# Decides how to store the data in JSON files and how to read from them. It uses the Storage class to perform file operations. The StorageHandler class provides methods to store books, persons, and rentals by appending new entries to the existing data in the respective JSON files.
# This class is responsible for handling the storage of books, rentals, and persons in JSON files. It uses the Storage class to read and write data to the respective JSON files. The methods in this class allow for storing books, persons, and rentals by appending new entries to the existing data in the JSON files.
require_relative 'storage'
require 'json'

class StorageHandler
  def initialize
    @storage = Storage.new
    @books = 'books.json'
    @rentals = 'rentals.json'
    @persons = 'peoples.json'
  end

  def store_books(title, author)
    books = []
    book = { title: title, author: author }
    books = @storage.file_read(@books) if File.exist?(@books)
    books.push(book)
    @storage.file_write(@books, books)
  end

  def store_persons(person)
    persons = []
    persons = @storage.file_read(@persons) if File.exist?(@persons)
    persons.push(person)
    @storage.file_write(@persons, persons)
  end

  def store_rentals(rental)
    rentals = []
    rentals = @storage.file_read(@rentals) if File.exist?(@rentals)
    rentals.push(rental)
    @storage.file_write(@rentals, rentals)
  end
end