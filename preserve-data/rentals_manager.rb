require 'json'

class RentalsManager
  attr_accessor :rentals

  def initialize
    @rentals = []
  end

  def load_rental_data
    load_rentals
  end

  def save_rental_data
    save_rentals
    puts 'Rental saved!'
  rescue StandardError => e
    puts "Error saving rental data: #{e.message}"
  end

  def save_rentals
    File.open('rentals.json', 'w') do |file|
      file.puts @rentals.map { |rental|
                  {
                    'date' => rental.date,
                    'book' => rental.book.to_hash,
                    'person' => rental.person.to_hash
                  }
                }.to_json
    end
  end

  private

  def load_rentals
    return unless File.exist?('rentals.json')

    json_str = File.read('rentals.json')

    @rentals = JSON.parse(json_str).map do |rental_data|
      book = Book.new(rental_data['book']['id'], rental_data['book']['title'], rental_data['book']['author'])
      person = Person.new(rental_data['person']['id'], rental_data['person']['name'], rental_data['person']['age'])
      Rental.new(rental_data['date'], book, person)
    end
  end
end
