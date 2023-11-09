require_relative 'app'

def handle_list_books(app)
  app.books.each do |book|
    puts "Title: #{book.title}"
    puts "Author: #{book.author}"
    puts '----------'
  end
end

def handle_list_people(app)
  app.people.each do |person|
    puts "Name: #{person.correct_name}"
    puts "Age: #{person.age}"
    puts "Classroom: #{person.classroom&.label}" if person.is_a?(Student)
    puts "Specialization: #{person.specialization}" if person.is_a?(Teacher)
    puts '----------'
  end
end

def handle_create_person(_app)
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

def handle_create_book(_app)
  puts "Enter book's title: "
  title = gets.chomp

  puts "Enter book's author: "
  author = gets.chomp

  book = Book.new(title, author)
  book.save
  puts "Book #{book.title} created successfully."
end

def handle_create_rental(_app)
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

def handle_list_rentals(_app)
  puts "Enter person's ID: "
  person_id = gets.chomp.to_i

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

def handle_quit
  puts 'Exiting...'
end

def main
  app = App.new

  loop do
    display_menu
    choice = user_choice
    handle_menu_option(choice, app)
  end
end

def display_menu
  puts 'Menu:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts '7. Quit'
end

def user_choice
  puts 'Enter your choice: '
  gets.chomp.to_i
end

main
