require 'date'
require_relative '../author'
require_relative '../game'

describe Author do
  let(:firstname) { 'John' }
  let(:lastname) { 'Doe' }
  subject { described_class.new(firstname, lastname) }

  describe '#initialize' do
    it 'assigns the correct values to instance variables' do
      expect(subject.instance_variable_get(:@id)).to be_an(Integer)
      expect(subject.instance_variable_get(:@firstname)).to eq(firstname)
      expect(subject.instance_variable_get(:@lastname)).to eq(lastname)
      expect(subject.instance_variable_get(:@items)).to be_an(Array)
      expect(subject.instance_variable_get(:@items)).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('item') }

    it 'sets the author of the added item to itself' do
      expect(item).to receive(:author=).with(subject)
      subject.add_item(item)
    end
  end

  describe '#to_hash' do
    let(:item1) { double('item1') }
    let(:item2) { double('item2') }

    before do
      allow(item1).to receive(:to_hash).and_return({ foo: 'bar' })
      allow(item2).to receive(:to_hash).and_return({ baz: 'qux' })
      subject.instance_variable_set(:@items, [item1, item2])
    end

    it 'returns a hash with the correct keys and values' do
      expected_hash = {
        id: subject.instance_variable_get(:@id),
        firstname: firstname,
        lastname: lastname,
        items: [
          { foo: 'bar' },
          { baz: 'qux' }
        ]
      }
      expect(subject.to_hash).to eq(expected_hash)
    end
  end
end
