require_relative 'spec_helper'

describe Book do
  let(:book_id) { 1 }
  let(:book_title) { 'Test Book' }
  let(:book_author) { 'Test Author' }
  let(:book) { Book.new(book_id, book_title, book_author) }

  describe '#initialize' do
    it 'creates a new Book instance with the given id, title, and author' do
      expect(book.id).to eq(book_id)
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(book_author)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book' do
      rental = double('Rental')
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the book' do
      expected_hash = {
        'id' => book_id,
        'title' => book_title,
        'author' => book_author
      }
      expect(book.to_hash).to eq(expected_hash)
    end
  end
end
