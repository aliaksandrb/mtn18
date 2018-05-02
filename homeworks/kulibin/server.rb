# class Server is a parent class
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
    cpu.even?
  end

  def deploy!(ip_host = @ip, type = Server::TYPE)
    @name = "#{ip_host}-#{type}"
    "#{ip_host}-#{type}"
  end
end
