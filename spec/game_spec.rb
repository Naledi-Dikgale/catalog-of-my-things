require_relative '../item'
require_relative '../game'
require 'date'

RSpec.describe Game do
  let(:last_played_at) { Date.today.prev_year(1).to_s }
  let(:published_date) { Date.today.prev_year(2).to_s }
  let(:game) { Game.new(true, last_played_at, published_date) }

  describe '#initialize' do
    it 'sets the last_played_at attribute' do
      expect(game.last_played_at).to eq(last_played_at)
    end

    it 'sets the published_date attribute' do
      expect(game.published_date).to eq(published_date)
    end
  end

  describe '#can_be_archived?' do
    context 'when the last_played_at is within the last two years' do
      let(:last_played_at) { Date.today.prev_year(1).to_s }
    end

    context 'when the last_played_at is more than two years ago' do
      let(:last_played_at) { (Date.today - (365 * 2) - 1).to_s }
    end

    context 'when the parent class can be archived' do
      before do
        allow(game).to receive(:super).and_return(true)
      end
    end
  end
end
