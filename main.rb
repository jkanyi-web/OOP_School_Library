require_relative 'app'

def main
  app = App.new

  loop do
    puts "\nChoose an option:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      # Collect user input for creating a person
      puts 'Is the person a teacher? (y/n)'
      is_teacher = gets.chomp.downcase == 'y'
      puts 'Enter ID:'
      id = gets.chomp.to_i
      puts 'Enter age:'
      age = gets.chomp.to_i
      puts 'Enter name:'
      name = gets.chomp
      app.create_person(is_teacher, id, age, name)
    when 4
      # Collect user input for creating a book
      puts 'Enter book ID:'
      id = gets.chomp
      puts 'Enter title:'
      title = gets.chomp
      puts 'Enter author:'
      author = gets.chomp
      app.create_book(id, title, author)
      puts 'Book created successfully...'
    when 5
      # List all available people and books
      puts 'Available people:'
      app.list_all_people
      puts 'Available books:'
      app.list_all_books

      # Collect user input for creating a rental
      puts 'Enter the number of the person:'
      person_number = gets.chomp.to_i
      puts 'Enter the number of the book:'
      book_number = gets.chomp.to_i

      # Check if the entered numbers are valid
      people = app.instance_variable_get(:@people)
      books = app.instance_variable_get(:@books)

      if person_number.between?(1, people.length) && book_number.between?(1, books.length)
        # Select the person and book from the lists
        person = people[person_number - 1]
        book = books[book_number - 1]

        # Collect rental date input
        puts 'Enter rental date (YYYY-MM-DD):'
        rental_date = gets.chomp

        # Create the rental
        app.create_rental(person.id, book.id, rental_date)
      else
        puts 'Invalid person or book selection.'
      end

    when 6
      puts 'Enter person ID:'
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 7
      puts 'Thanks for using the app, Goodbye!'
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

main
