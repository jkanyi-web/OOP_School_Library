require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class App
  attr_reader :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each do |book|
      puts "ID: #{book.id}, Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      role = person.is_a?(Teacher) ? 'Teacher' : 'Student'
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Role: #{role}"
    end
  end

  def create_person(is_teacher, id, age, name, specialization: nil)
    if is_teacher
      person = Teacher.new(id, age, specialization, name)
      puts 'Teacher created successfully...'

    else
      person = Student.new(id, age, name)
      puts 'Student created successfully...'
    end
    @people << person
  end

  def create_book(id, title, author)
    book = Book.new(id, title, author)
    @books << book
  end

  def create_rental(person_id, book_id, date_str)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.id == book_id }

    if person && book
      rental = Rental.new(date_str, book, person)
      @rentals << rental
      puts 'Rental created successfully.'
    else
      puts 'Person or book not found.'
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }
    if person
      person_rentals = @rentals.select { |rental| rental.person == person }
      if person_rentals.empty?
        puts 'No rentals for this person.'
      else
        puts "Rentals for #{person.name}:"
        person_rentals.each do |rental|
          puts "Book: #{rental.book.title}, Date: #{rental.date}"
        end
      end
    else
      puts 'Person not found.'
    end
  end
end
