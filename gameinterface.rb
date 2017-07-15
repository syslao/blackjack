class GameInterface
  def initialize
    @bank   = Bank.new(0)
    @deck   = CardDeck.new
    @dealer = Dealer.new
    @user   = create_user
  end

  def start
    make_bet
  end

  def make_bet(value = 10)
    [@user.account, @dealer.account].each { |player| player.transfer(@bank, value) }
  end

  def create_user
    print 'Введите Ваше имя: '
    @user = User.new(gets.strip.downcase.capitalize)
  end
end
