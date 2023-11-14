class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.assign_to_classroom(self)
  end

  def remove_student(student)
    @students.delete(student)
    student.remove_from_classroom
  end
end
