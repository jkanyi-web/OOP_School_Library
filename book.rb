class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(id, title, author)
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end
end
