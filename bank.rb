class Bank
  attr_accessor :sum

  def initialize(sum)
    @sum = sum
  end

  def transfer(receiver, value)
    self.sum -= value
    receiver.sum += value
  end
end
