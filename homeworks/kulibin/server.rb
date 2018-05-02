#!/usr/bin/env ruby .

# realizuet klass Server
class Server
  attr_accessor :cpu, :ip, :name, :ram, :ssd, :version
  attr_accessor :deployed_by, :spawned_by

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
    cpu.even?
  end
end
