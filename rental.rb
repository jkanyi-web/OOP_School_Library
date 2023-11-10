class Rental
  attr_accessor :date, :book, :person

  def self.belongs_to(association)
    define_method(association) do
      instance_variable_get("@#{association}")
    end

    define_method("#{association}=") do |value|
      instance_variable_set("@#{association}", value)
    end
  end

  belongs_to :book
  belongs_to :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end
end
