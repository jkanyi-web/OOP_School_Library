require_relative 'spec_helper'

describe Student do
  let(:student_id) { 1 }
  let(:student_age) { 20 }
  let(:student_name) { 'John' }
  let(:student) { Student.new(student_id, student_age, student_name) }

  describe '#initialize' do
    it 'creates a new Student instance with the given id, age, and name' do
      expect(student.id).to eq(student_id)
      expect(student.age).to eq(student_age)
      expect(student.name).to eq(student_name)
    end

    it 'sets the name to "unknown" if not provided' do
      student_without_name = Student.new(student_id, student_age)
      expect(student_without_name.name).to eq('unknown')
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
