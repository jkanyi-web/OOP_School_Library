class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    add_to_collections
  end

  def to_hash
    {
      'date' => @date,
      'book' => @book.to_hash,
      'person' => @person.to_hash
    }
  end

  private

  def add_to_collections
    @book.rentals << self
    @person.rentals << self
  end
end
