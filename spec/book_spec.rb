require_relative '../book'

describe Book do
  let(:published_date) { '2023-01-01' }
  let(:title) { 'Sample Book' }
  let(:author) { 'John Doe' }
  let(:cover_state) { 'good' }

  subject { described_class.new(published_date, title, author, cover_state) }

  describe '#initialize' do
    it 'assigns the correct values to instance variables' do
      expect(subject.published_date).to eq(published_date)
      expect(subject.title).to eq(title)
      expect(subject.author).to eq(author)
      expect(subject.cover_state).to eq(cover_state)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with the correct keys and values' do
      expected_hash = {
        published_date: published_date,
        publisher: nil,
        cover_state: cover_state
      }
      expect(subject.to_hash).to eq(expected_hash)
    end
  end
end
