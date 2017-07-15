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

  def show_cards
    cards.each_key { |card| print "#{card} " }
    puts "#{name}: #{score}"
  end

  def score
    cards.values.inject(:+)
  end
end
