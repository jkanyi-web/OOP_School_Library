require_relative 'spec_helper'
require 'date'

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

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person = Person.new(1, 20, 'Alice', parent_permission: false)
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age but has parent permission' do
      it 'returns true' do
        person = Person.new(2, 16, 'Bob', parent_permission: true)
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age and does not have parent permission' do
      it 'returns false' do
        person = Person.new(3, 15, 'Charlie', parent_permission: false)
        expect(person.can_use_services?).to eq(false)
      end
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person' do
      person = Person.new(1, 18, 'David', parent_permission: true)
      book = Book.new(1, 'The Great Gatsby', 'F. Scott Fitzgerald')
      date = Date.new(2023, 11, 1)

      expect { person.add_rental(date, book) }.to change { person.rentals.size }.by(2)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with person attributes' do
      person = Person.new(1, 25, 'Eve', parent_permission: true)
      expected_hash = { 'id' => 1, 'age' => 25, 'name' => 'Eve' }

      expect(person.to_hash).to eq(expected_hash)
    end
  end
end
