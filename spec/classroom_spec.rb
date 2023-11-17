# classroom_spec.rb

require_relative 'spec_helper'

describe Classroom do
  let(:classroom_label) { 'Math101' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student) { Student.new(1, 18, 'John') }

  describe '#initialize' do
    it 'creates a new Classroom instance with the given label' do
      expect(classroom.label).to eq(classroom_label)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and assigns the classroom to the student' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#remove_student' do
    it 'removes a student from the classroom and removes the classroom from the student' do
      classroom.add_student(student)
      classroom.remove_student(student)
      expect(classroom.students).to be_empty
      expect(student.classroom).to be_nil
    end
  end
end
