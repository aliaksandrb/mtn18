# class server with default methods
class Server
  Const TYPE == 'base'.freeze
  attr_accessor :ip_address,
                :cpu_counter,
                :name,
                :type

  def initialize
    @type = TYPE
    @ip_address = ip_address
    @cpu_counter = cpu_counter
  end

  def ping(cpu_counter)
    cpu_counter.even? ? 'true' : 'false'
  end

  def deploy!(ip_address, type = Server::TYPE)
    @name = "#{ip_address}-#{type}"
    "#{ip_address}-#{type}"
  end
end
