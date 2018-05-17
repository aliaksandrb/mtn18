#!/bin/env ruby

# Servers
class Server
  TYPE = 'base'.freeze
  attr_accessor :deployed_by, :ip, :cpu, :name, :ram, :ssd, :type, :spawned_by

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
