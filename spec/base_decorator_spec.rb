# decorator_spec.rb

require_relative 'spec_helper'

describe Decorator do
  let(:nameable_object) { double('Nameable') }
  let(:decorator) { Decorator.new(nameable_object) }

  describe '#initialize' do
    it 'creates a new Decorator instance with the given nameable object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable_object)
    end
  end

  describe '#correct_name' do
    it 'delegates the correct_name method to the wrapped nameable object' do
      allow(nameable_object).to receive(:correct_name).and_return('John Doe')
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
