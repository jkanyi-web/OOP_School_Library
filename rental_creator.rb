class RentalCreator
  def initialize(app)
    @app = app
  end

  def create_rental
    puts 'Available people:'
    @app.list_all_people
    puts 'Available books:'
    @app.list_all_books

    person_number, book_number = @app.person_book_numbers

    if @app.valid_numbers?(person_number, book_number)
      person = @app.people[person_number - 1]
      book = @app.books[book_number - 1]

      puts 'Enter rental date (YYYY-MM-DD):'
      rental_date = gets.chomp

      @app.create_rental(person.id, book.id, rental_date)
    else
      puts 'Invalid person or book selection.'
    end
  end
end
