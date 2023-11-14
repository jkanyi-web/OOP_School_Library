class BookCreator
  def initialize(app)
    @app = app
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
end
