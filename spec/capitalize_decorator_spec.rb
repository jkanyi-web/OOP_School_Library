require_relative 'spec_helper'

describe CapitalizeDecorator do
  let(:nameable_object) { double('Nameable') }
  let(:capitalize_decorator) { CapitalizeDecorator.new(nameable_object) }

  describe '#initialize' do
    it 'creates a new CapitalizeDecorator instance with the given nameable object' do
      expect(capitalize_decorator.instance_variable_get(:@nameable)).to eq(nameable_object)
    end
  end

  describe '#correct_name' do
    it 'capitalizes the correct_name method of the wrapped nameable object' do
      allow(nameable_object).to receive(:correct_name).and_return('john doe')
      expect(capitalize_decorator.correct_name).to eq('John doe')
    end
  end
end
