# Servers
class Server
  TYPE = 'base'.freeze
  attr_accessor :deployed_by
  attr_accessor  :ip
  attr_accessor  :cpu
  attr_accessor  :name
  attr_accessor  :ram
  attr_accessor  :ssd
  attr_accessor  :type
  attr_accessor  :spawned_by

  def initialize
    @type = self.class::TYPE
  end

  def self.new_server
    new
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
  end

  def ping
    cpu.even?
  end
end
