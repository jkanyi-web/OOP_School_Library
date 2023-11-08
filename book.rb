class Book
  has_many :rentals

  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end
