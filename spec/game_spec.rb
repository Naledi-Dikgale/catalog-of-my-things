require 'rspec'
require_relative '../game'
require_relative '../author'

RSpec.describe 'Game' do
  describe '#can_be_archived?' do
    it 'returns true if parents_results && last_played_at > 365 * 2_' do
      multiplayer = true
      last_played_at = Date.parse('2021-06-01')
      publish_date = Date.parse('2020-01-01')

      results = Game.new(multiplayer, last_played_at, publish_date)
      final = results.can_be_archived?
      expect(final).to eql(true)
    end
  end
end