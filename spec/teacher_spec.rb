# teacher_spec.rb

require_relative 'spec_helper'

describe Teacher do
  let(:teacher_id) { 2 }
  let(:teacher_age) { 30 }
  let(:teacher_name) { 'Jane' }
  let(:teacher_specialization) { 'Math' }
  let(:teacher) { Teacher.new(teacher_id, teacher_age, teacher_specialization, teacher_name) }

  describe '#initialize' do
    it 'creates a new Teacher instance with the given id, age, name, and specialization' do
      expect(teacher.id).to eq(teacher_id)
      expect(teacher.age).to eq(teacher_age)
      expect(teacher.name).to eq(teacher_name)
      expect(teacher.specialization).to eq(teacher_specialization)
    end

    it 'sets the name to "unknown" if not provided' do
      teacher_without_name = Teacher.new(teacher_id, teacher_age, teacher_specialization)
      expect(teacher_without_name.name).to eq('unknown')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
