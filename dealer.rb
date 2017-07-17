class Dealer < Player
  def initialize(name = 'NPC')
    super
    @name = name
  end

  def show_cards_back
    cards.each { print "X " }
  end
end
