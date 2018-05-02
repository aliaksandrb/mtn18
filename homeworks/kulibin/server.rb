# 'server' class
class Server
  TYPE = 'base'.freeze

  attr_accessor :name, :type, :ip, :cpu, :ram, :ssd, :spawned_by, :deployed_by

  def initialize
    @type = TYPE
  end

  def self.new_server
    new
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
  end

  def ping
    @cpu.even?
  end
end
