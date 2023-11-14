def create_person
  puts 'Is the person a teacher? (y/n)'
  is_teacher = gets.chomp.downcase == 'y'
  puts 'Enter ID:'
  id = gets.chomp.to_i
  puts 'Enter age:'
  age = gets.chomp.to_i
  puts 'Enter name:'
  name = gets.chomp
  person = is_teacher ? Teacher.new(id, age, name) : Student.new(id, age, name)
  @app.create_person(is_teacher, id, age, name)
  puts "#{person.class} created successfully..."
end

def create_book
  puts 'Enter book ID:'
  id = gets.chomp
  puts 'Enter title:'
  title = gets.chomp
  puts 'Enter author:'
  author = gets.chomp
  @app.create_book(id, title, author)
end

def create_rental
  puts 'Available people:'
  @app.list_all_people
  puts 'Available books:'
  @app.list_all_books

  person_number, book_number = person_book_numbers

  if valid_numbers?(person_number, book_number)
    person = @app.people[person_number - 1]
    book = @app.books[book_number - 1]

    puts 'Enter rental date (YYYY-MM-DD):'
    rental_date = gets.chomp

    @app.create_rental(person.id, book.id, rental_date)
  else
    puts 'Invalid person or book selection.'
  end
end

def person_book_numbers
  puts 'Enter the number of the person:'
  person_number = gets.chomp.to_i
  puts 'Enter the number of the book:'
  book_number = gets.chomp.to_i
  [person_number, book_number]
end

def valid_numbers?(person_number, book_number)
  people_count = @app.people.length
  books_count = @app.books.length
  person_number.between?(1, people_count) && book_number.between?(1, books_count)
end

def list_rentals_for_person
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  @app.list_rentals_for_person(person_id)
end

def quit
  puts 'Thanks for using the app, Goodbye!'
  exit
end

def handle_invalid_option
  puts 'Invalid option. Please try again.'
end

AppRunner.new.run
