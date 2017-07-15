class Player
  attr_reader :name, :cards, :account

  def initialize(name)
    @name = name
    @cards = {}
    @account = Bank.new(100)
  end
end
