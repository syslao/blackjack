# encoding: utf-8

class Bank
  attr_accessor :sum

  def initialize(sum)
    @sum = sum
  end

  def transfer(receiver, value)
    raise "Кончились деньги, играть не на что!" if sum.zero?
    self.sum -= value
    receiver.sum += value
  end
end
