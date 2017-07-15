class GameInterface
  def initialize
    @bank   = Bank.new(0)
    @deck   = CardDeck.new
    @dealer = Dealer.new
    @user   = create_user
    @actions = ['1-Пропустить ход', '2-Взять карту', '3-Открыть карты', '0-Выход']
  end

  def start
    make_bet
    user_actions
    make_action(@user_choice)
  end

  def user_actions
    @actions.each { |action| puts "#{action} " }
    @user_choice = gets.to_i
  end

  def make_action(action)
    case action
    when 1
      dealer_turn
    when 2
      @user.take_card(@deck.remove_card)
      dealer_turn
    when 3
    when 0
      puts 'До встречи'
      exit
    else
      puts 'Неизвестная команда!'
    end
  end

  def make_bet(value = 10)
    [@user.account, @dealer.account].each { |player| player.transfer(@bank, value) }
  end

  def dealer_turn
    @dealer.take_card(@deck.remove_card)
  end

  def create_user
    print 'Введите Ваше имя: '
    @user = User.new(gets.strip.downcase.capitalize)
  end
end
