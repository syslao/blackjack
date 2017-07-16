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
    until @user.cards.count > 2
      user_actions
      make_action(@user_choice)
    end
    open_cards
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
      open_cards
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

  def winner
    winner =
    if @user.score > @dealer.score
      @user
    elsif @user.score < @dealer.score
      @dealer
    end
    winner ? show_winner(winner) : puts('Ничья')
  end

  def show_winner(winner)
    puts "Выиграл - #{winner.name}!"
  end

  def dealer_turn
    @dealer.take_card(@deck.remove_card)
  end

  def open_cards
    @dealer.show_cards
    @user.show_cards
  end

  def create_user
    print 'Введите Ваше имя: '
    @user = User.new(gets.strip.downcase.capitalize)
  end
end
