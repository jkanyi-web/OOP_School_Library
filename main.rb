require_relative 'app'

class AppRunner
  def initialize
    @app = App.new
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

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_option(choice)
    end
  end

  private

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
    send(option_method)
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_people
    @app.list_all_people
  end
end
