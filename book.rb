class Book
  attr_accessor :id, :title, :author

  def self.many?(association)
    define_method(association) do
      instance_variable_get("@#{association}")
    end
  end

  many? :rentals

  def initialize(id, title, author)
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
  end
end
