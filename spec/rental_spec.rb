require_relative 'spec_helper'

describe Rental do
  let(:book) { Book.new(1, 'Title', 'Author') }
  let(:person) { Person.new(1, 18, 'John Doe', parent_permission: true) }
  let(:rental) { Rental.new('2022-01-01', book, person) }

  describe '#initialize' do
    it 'creates a new rental object with the given attributes' do
      expect(rental.instance_variable_get(:@date)).to eq('2022-01-01')
      expect(rental.instance_variable_get(:@book)).to eq(book)
      expect(rental.instance_variable_get(:@person)).to eq(person)
    end

    it 'adds the rental to the book and person collections' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the rental' do
      expected_hash = {
        'date' => '2022-01-01',
        'book' => book.to_hash,
        'person' => person.to_hash
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end
end
