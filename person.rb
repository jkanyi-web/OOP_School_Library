class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def self.many?(association)
    define_method(association) do
      instance_variable_get("@#{association}")
    end
  end

  many? :rentals

  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    age >= 18
  end
end
