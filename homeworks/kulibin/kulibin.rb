#!/usr/bin/env ruby .

require_relative './azure.rb'
require_relative './aws.rb'

# dannyj fajl realizuet klass kulibin
class Kulibin
  include AzurePlugin
  include AwsPlugin
  attr_accessor :version

  def self.setup
    oldkul = Kulibin.new
    yield oldkul
    oldkul
  end

  def initialize
    @proki = []
    @serverconf = {}
  end

  def define_server(config)
    @serverconf[config] = Server.new
    yield(@serverconf[config])
  end

  def steps(step, &block)
    @proki << { name: step, block: block }
  end

  def run(config, server)
    server.cpu = @serverconf[config].cpu if @serverconf[config].cpu
    server.ssd = @serverconf[config].ssd if @serverconf[config].ssd
    server.ram = @serverconf[config].ram if @serverconf[config].ram
    @proki.each do |step|
      step[:block].call(server)
    end
  end
end
