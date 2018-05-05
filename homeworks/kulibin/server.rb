# Server class
class Server
  attr_accessor :ip, :cpu, :ram, :ssd, :spawned_by, :deployed_by, :name
  attr_reader :type
  TYPE = 'base'.freeze

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
