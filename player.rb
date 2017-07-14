class Player
  attr_reader :name, :cards

  def initialize(name)
    @name = name
    @cards = {}
  end
end
