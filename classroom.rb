# classroom.rb
class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end

  def remove_student(student)
    @students.delete(student)
    student.classroom = nil
  end
end
