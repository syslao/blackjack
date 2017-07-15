# encoding: utf-8

require_relative 'gameinterface'
require_relative 'carddeck'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'bank'


interface = GameInterface.new

loop do
  interface.start
end
