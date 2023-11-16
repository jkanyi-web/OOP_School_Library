require 'json'

class BooksManager
  attr_accessor :books

  def initialize
    @books = []
  end

  def load_books_data
    load_books
  end

  def save_data
    save_books
    puts 'Books saved!'
  rescue StandardError => e
    puts "Error saving books data: #{e.message}"
  end

  def save_books
    File.open('books.json', 'w') do |file|
      file.puts @books.map { |book|
        {
          'id' => book.id,
          'title' => book.title,
          'author' => book.author
        }
      }.to_json
    end
  end

  private

  def load_books
    return unless File.exist?('books.json')

    json_str = File.read('books.json')
    @books = JSON.parse(json_str).map do |book_data|
      Book.new(book_data['id'], book_data['title'], book_data['author'])
    end
  end
end
