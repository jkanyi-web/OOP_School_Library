require_relative 'person'

class Student < Person
  attr_accessor :name, :classroom

  def initialize(id, age, name = 'unknown')
    super(id, age, name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
