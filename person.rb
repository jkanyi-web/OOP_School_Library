class Person
  attr_reader :id, :name, :age, :rentals

  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
  end

  def to_hash
    {
      'id' => id,
      'age' => age,
      'name' => name
    }
  end

  private

  def of_age?
    age >= 18
  end
end

class PersonService
  def self.create_person(is_teacher, id, age, name, specialization)
    person = is_teacher ? Teacher.new(id, age, specialization, name) : Student.new(id, age, name)
    puts "#{person.class} created successfully..."
    person
  end
end
