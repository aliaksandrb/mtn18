#!/bin/env ruby
require_relative './aws.rb'
require_relative './azure.rb'
# Class top-level documentation comment
class Kulibin
  include ::AzurePlugin
  include ::AwsPlugin
  attr_accessor :version

  def initialize
    @shapes = {}
    @steps = []
  end

  def self.setup
    kulibin = Kulibin.new
    yield(kulibin)
    kulibin
  end

  def define_server(shape)
    @shapes[shape] = Server.new
    yield(@shapes[shape])
  end

  def steps(step, &block)
    @steps << {
      name: step,
      block: block
    }
  end

  def run(shape, server)
    server = set_server_properties(shape, server)
    @steps.each do |step|
      step[:block].call(server)
    end
  end

  def set_server_properties(shape, server)
    server.cpu = @shapes[shape].cpu if @shapes[shape].cpu
    server.ssd = @shapes[shape].ssd if @shapes[shape].ssd
    server.ram = @shapes[shape].ram if @shapes[shape].ram
    server
  end
end
