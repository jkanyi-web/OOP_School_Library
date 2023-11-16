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

  def to_hash
    {
      'id' => id,
      'title' => title,
      'author' => author
    }
  end
end
