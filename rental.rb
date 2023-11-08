class Rental
  belongs_to :book
  belongs_to :person

  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end
end
