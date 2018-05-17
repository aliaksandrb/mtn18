#!/usr/bin/env ruby

require_relative 'aws'
require_relative 'azure'
# top
class Kulibin
  include ::AwsPlugin
  include ::AzurePlugin
  attr_accessor :version

  def initialize
    @configs = {}
    @do_it = []
  end

  def self.setup
    kulibin = Kulibin.new
    yield(kulibin)
    kulibin
  end

  def define_server(name)
    @configs[name] = Server.new
    yield(@configs[name])
  end

  def steps(name, &block)
    @do_it << {
      name: name,
      block: block
    }
  end

  def run(config, server)
    server.ram = @configs[config].ram if @configs[config].ram
    server.cpu = @configs[config].cpu if @configs[config].cpu
    server.ssd = @configs[config].ssd if @configs[config].ssd
    @do_it.each { |f| f[:block].call(server) }
  end
end
