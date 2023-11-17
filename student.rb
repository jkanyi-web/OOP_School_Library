require_relative 'person'

class Student < Person
  attr_accessor :name, :classroom

  def initialize(id, age, name = 'unknown')
    super(id, age, name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def assign_to_classroom(classroom)
    @classroom = classroom
  end

  def remove_from_classroom
    @classroom = nil
  end
end
