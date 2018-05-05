# Basic server class
class Server
  TYPE = 'base'.freeze

  attr_accessor :spawned_by, :deployed_by
  attr_accessor :cpu, :ram, :ssd, :name, :type, :ip

  def initialize
    @type = TYPE
  end

  def self.new_server
    new
  end

  def status
    puts "Instance #{@name} #{@status}"
  end

  def ping
    @cpu.even?
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
    @status = 'Running'
  end
end
