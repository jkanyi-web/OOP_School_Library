require_relative 'person'

class Student < Person
  attr_reader :classroom
  
  belongs_to :classroom

  include Person
  attr_accessor :name

  def initialize(id, age, classroom, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
