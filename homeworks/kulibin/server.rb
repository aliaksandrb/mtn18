# Server class
class Server
  TYPE = 'base'.freeze

  attr_accessor :name, :ip, :type, :cpu, :ram, :ssd

  def self.new_server
    new
  end

  def initialize
    @type = TYPE
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
  end

  def ping
    @cpu.even?
  end
end
