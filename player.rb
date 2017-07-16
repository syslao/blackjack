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
    result = cards.values.inject(:+)
    cards.each do |card|
      if card[1] == 1
        temp_res = result + 10
        result = temp_res < 22 ? temp_res : result
      end
    end
    result <= 21 ? result : 0
  end
end
