#!/usr/bin/env ruby

require_relative 'azure'
require_relative 'aws'

# Kulibin class description
class Kulibin
  include AzurePlugin
  include AwsPlugin

  attr_accessor :version

  def self.setup
    setup_var = new
    yield(setup_var)
    setup_var
  end

  def initialize
    @shapes = {}
    @procs = []
  end

  def define_server(server_name)
    instance_yielded = Server.new_server
    yield(instance_yielded)
    @shapes[server_name] = instance_yielded
  end

  def steps(_name, &one_by_one)
    @procs.push(one_by_one.to_proc)
  end

  def run(shape, server_name)
    server_name.cpu = @shapes[shape].cpu
    server_name.ram = @shapes[shape].ram
    server_name.ssd = @shapes[shape].ssd
    @procs.each do |some|
      some.call(server_name)
    end
  end
end
