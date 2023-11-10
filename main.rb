require_relative 'app'

def display_menu
  puts "\nChoose an option:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts '7. Quit'
end

def create_person(app)
  puts 'Is the person a teacher? (y/n)'
  is_teacher = gets.chomp.downcase == 'y'
  puts 'Enter ID:'
  id = gets.chomp.to_i
  puts 'Enter age:'
  age = gets.chomp.to_i
  puts 'Enter name:'
  name = gets.chomp
  app.create_person(is_teacher, id, age, name)
end

def create_book(app)
  puts 'Enter book ID:'
  id = gets.chomp
  puts 'Enter title:'
  title = gets.chomp
  puts 'Enter author:'
  author = gets.chomp
  app.create_book(id, title, author)
  puts 'Book created successfully...'
end

def create_rental(app)
  puts 'Available people:'
  app.list_all_people
  puts 'Available books:'
  app.list_all_books

  person_number, book_number = person_book_numbers(app)

  if valid_numbers?(app, person_number, book_number)
    person = app.people[person_number - 1]
    book = app.books[book_number - 1]

    puts 'Enter rental date (YYYY-MM-DD):'
    rental_date = gets.chomp

    app.create_rental(person.id, book.id, rental_date)
  else
    puts 'Invalid person or book selection.'
  end
end

def person_book_numbers(_app)
  puts 'Enter the number of the person:'
  person_number = gets.chomp.to_i
  puts 'Enter the number of the book:'
  book_number = gets.chomp.to_i
  [person_number, book_number]
end

def valid_numbers?(app, person_number, book_number)
  people_count = app.people.length
  books_count = app.books.length
  person_number.between?(1, people_count) && book_number.between?(1, books_count)
end

def handle_option(choice, app)
  option_mapping = {
    1 => :handle_list_all_books,
    2 => :handle_list_all_people,
    3 => :handle_create_person,
    4 => :handle_create_book,
    5 => :handle_create_rental,
    6 => :handle_list_rentals_for_person,
    7 => :handle_quit
  }

  handler_method = option_mapping[choice] || :handle_invalid_option
  send(handler_method, app)
end

def handle_list_all_books(app)
  app.list_all_books
end

def handle_list_all_people(app)
  app.list_all_people
end

def handle_create_person(app)
  create_person(app)
end

def handle_create_book(app)
  create_book(app)
end

def handle_create_rental(app)
  create_rental(app)
end

def handle_list_rentals_for_person(app)
  list_rentals_for_person(app)
end

def list_rentals_for_person(app)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end

def handle_quit
  puts 'Thanks for using the app, Goodbye!'
  exit
end

def handle_invalid_option(_app)
  puts 'Invalid option. Please try again.'
end

def main
  app = App.new

  loop do
    display_menu
    choice = gets.chomp.to_i
    handle_option(choice, app)
  end
end

main
