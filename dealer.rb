class Dealer < Player
  def initialize(name = 'Dealer')
    super
    @name = name
  end

  def show_cards_back
    cards.each { print 'X ' }
  end
end
