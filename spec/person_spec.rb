require_relative 'spec_helper'

describe Person do
  describe '#initialize' do
    it 'creates a new person object with the given attributes' do
      person = Person.new(1, 18, 'John Doe', parent_permission: true)

      expect(person.instance_variable_get(:@id)).to eq(1)
      expect(person.instance_variable_get(:@age)).to eq(18)
      expect(person.instance_variable_get(:@name)).to eq('John Doe')
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
      expect(person.instance_variable_get(:@rentals)).to eq([])
    end

    it 'sets the default name to "unknown" if not provided' do
      person = Person.new(2, 16)

      expect(person.instance_variable_get(:@name)).to eq('unknown')
    end
  end
end
