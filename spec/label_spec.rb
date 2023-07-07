require_relative '../label'

describe Label do
  let(:title) { 'Sample Label' }
  subject { described_class.new(title) }

  describe '#initialize' do
    it 'assigns the correct value to the title instance variable' do
      expect(subject.title).to eq(title)
    end

    it 'initializes the items array as an empty array' do
      expect(subject.items).to be_an(Array)
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { double('item') }

    it 'sets the label of the added item to itself' do
      expect(item).to receive(:label=).with(subject)
      subject.add_item(item)
    end
  end

  describe '#to_hash' do
    let(:item1) { double('item1') }
    let(:item2) { double('item2') }

    before do
      allow(item1).to receive(:to_hash).and_return({ foo: 'bar' })
      allow(item2).to receive(:to_hash).and_return({ baz: 'qux' })
      subject.add_item(item1)
      subject.add_item(item2)
    end
  end
end
