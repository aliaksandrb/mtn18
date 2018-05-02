#!/usr/bin/env ruby
# top level
class Server
  TYPE = 'base'.freeze
  attr_accessor :deployed_by, :ip, :cpu, :ram, :ssd, :version, :type, :spawned_by, :name

  def initialize
    @type = self.class::TYPE
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
  end

  def ping
    @cpu.even?
  end
end
