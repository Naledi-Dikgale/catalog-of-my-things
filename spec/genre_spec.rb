# require_relative 'spec'
require_relative '../genre'

describe Genre do
  let(:name) { 'Action' }
  subject { described_class.new(name) }

  describe '#initialize' do
    it 'assigns the correct values to instance variables' do
      expect(subject.instance_variable_get(:@name)).to eq(name)
      expect(subject.instance_variable_get(:@items)).to be_an(Array)
      expect(subject.instance_variable_get(:@items)).to be_empty
    end
  end

  describe '#to_hash' do
    it 'returns a hash with the correct keys and values' do
      expected_hash = {
        name: name
      }
      expect(subject.to_hash).to eq(expected_hash)
    end
  end
end
