require_relative 'person'
require_relative 'book'
require_relative 'rental'

class App
  def list_books
    Book.all.each do |book|
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
      puts '----------'
    end
  end

  def list_people
    Person.all.each do |person|
      puts "Name: #{person.correct_name}"
      puts "Age: #{person.age}"
      puts "Classroom: #{person.classroom&.label}" if person.is_a?(Student)
      puts "Specialization: #{person.specialization}" if person.is_a?(Teacher)
      puts '----------'
    end
  end

  def create_person
    puts "Enter person's name: "
    name = gets.chomp

    puts "Enter person's age: "
    age = gets.chomp.to_i

    puts "Enter person's classroom label (if student): "
    classroom_label = gets.chomp

    puts "Enter person's specialization (if teacher): "
    specialization = gets.chomp

    if classroom_label
      classroom = Classroom.find_or_create_by(label: classroom_label)
      person = Student.new(age, name, classroom)
    else
      person = Teacher.new(age, name, specialization)
    end

    person.save
    puts "Person #{person.correct_name} created successfully."
  end

  def create_book
    puts "Enter book's title: "
    title = gets.chomp

    puts "Enter book's author: "
    author = gets.chomp

    book = Book.new(title, author)
    book.save
    puts "Book #{book.title} created successfully."
  end

  def create_rental
    puts "Enter person's ID: "
    person_id = gets.chomp.to_i

    person = Person.find(person_id)
    unless person
      puts "Person with ID #{person_id} not found."
      return
    end

    puts "Enter book's ID: "
    book_id = gets.chomp.to_i

    book = Book.find(book_id)
    unless book
      puts "Book with ID #{book_id} not found."
      return
    end

    puts 'Enter rental date (YYYY-MM-DD): '
    rental_date = gets.chomp

    rental = Rental.new(rental_date, book, person)
    rental.save
    puts "Rental for book #{book.title} by person #{person.correct_name} created successfully."
  end

  def list_rentals_for_person(person_id)
    person = Person.find(person_id)
    unless person
      puts "Person with ID #{person_id} not found."
      return
    end

    person.rentals.each do |rental|
      book = rental.book
      puts "Book: #{book.title}"
      puts "Rental Date: #{rental.date}"
      puts '----------'
    end
  end
end
