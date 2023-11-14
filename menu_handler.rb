class MenuHandler
  def initialize(app, person_creator, book_creator, rental_creator, rentals_lister)
    @app = app
    @person_creator = person_creator
    @book_creator = book_creator
    @rental_creator = rental_creator
    @rentals_lister = rentals_lister
    @menu_options = {
      1 => :list_all_books,
      2 => :list_all_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_for_person,
      7 => :quit
    }
  end

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

  def handle_option(choice)
    option_method = @menu_options[choice] || :handle_invalid_option

    # Pass necessary arguments to create_person if the option is to create a person
    if option_method == :create_person
      @person_creator.create_person
    else
      send(option_method)
    end
  end

  # Add the following methods
  def list_all_books
    @app.list_all_books
  end

  def list_all_people
    @app.list_all_people
  end

  def create_person
    @person_creator.create_person
  end

  def create_book
    @book_creator.create_book
  end

  def create_rental
    @rental_creator.create_rental
  end

  def list_rentals_for_person
    @rentals_lister.list_rentals_for_person
  end

  def quit
    puts 'Thanks for using the app, Goodbye!'
    exit
  end

  def handle_invalid_option
    puts 'Invalid option. Please try again.'
  end
end
