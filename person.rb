require_relative 'nameable'

class Person < Nameable
  has_many :rentals

  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    super(@nameable = name)
    @age = age
    @rentals = []
    @name = name
    @parent_permission = parent_permission
  end

  def add_rental(rental)
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
