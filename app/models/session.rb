class Session < ApplicationRecord
  has_secure_token
  serialize :player_hand, Array

  belongs_to :game, optional: true

  def required_card_number
    Game::MAX_PLAYER_HAND - self.player_hand.size
  end

  def player_cards
    Card.where(id: player_hand).pluck(:text)
  end
end
