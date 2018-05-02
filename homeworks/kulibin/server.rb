#!/usr/bin/env ruby

# Server class description
class Server
  TYPE = 'base'.freeze

  attr_accessor :cpu, :ram, :ssd, :ip, :name, :deployed_by, :spawned_by
  attr_reader :type

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

  def to_s
    "Server has type: #{@type}"
  end
end

# server = Server.new
# server.cpu = 2

# puts server
# puts server.cpu
# server.name = 'Pupking'
# server.ip = '10.6.20.5'
# puts server.deploy!
