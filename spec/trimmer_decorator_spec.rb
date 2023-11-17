require_relative 'spec_helper'

describe TrimmerDecorator do
  let(:nameable_object) { double('Nameable') }
  let(:trimmer_decorator) { TrimmerDecorator.new(nameable_object) }

  describe '#initialize' do
    it 'creates a new TrimmerDecorator instance with the given nameable object' do
      expect(trimmer_decorator.instance_variable_get(:@nameable)).to eq(nameable_object)
    end
  end

  describe '#correct_name' do
    it 'trims the correct_name method of the wrapped nameable object to 10 characters' do
      allow(nameable_object).to receive(:correct_name).and_return('John Doe The Third')
      expect(trimmer_decorator.correct_name).to eq('John Doe T')
    end
  end
end
