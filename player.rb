class Player
  attr_reader :name, :cards, :account

  def initialize(name)
    @name = name
    @cards = {}
    @account = Bank.new(100)
  end

  def take_card(card)
    cards[card[0]] = card[1]
  end
end
