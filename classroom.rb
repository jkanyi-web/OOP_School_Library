class Classroom
  has_many :students
  attr_accessor :label

  def add_student(student)
    students << student
    student.classroom = self
  end

  def remove_student(student)
    students.delete(student)
    student.classroom = nil
  end

  def initialize(label)
    @label = label
  end
end
