# basic class Server - parent
class Server
  TYPE = 'base'.freeze
  attr_accessor :cpu
  attr_accessor :ram
  attr_accessor :ssd
  attr_accessor :name
  attr_accessor :type
  attr_accessor :ip

  def initialize
    @type = TYPE
  end

  def ping
    return true if (@cpu % 2).equal? 0
    false
  end

  def deploy!(ip_host = @ip, type = Server::TYPE)
    @name = "#{ip_host}-#{type}"
    "#{ip_host}-#{type}"
  end
end
