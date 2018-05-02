require_relative 'aws'
require_relative 'azure'

# 'kulibin' class
class Kulibin
  include AzurePlugin
  include AwsPlugin
  attr_accessor :version, :cpu, :ram, :ssd

  def self.setup
    kulibin = Kulibin.new
    yield kulibin
    kulibin
  end

  def initialize
    @config = {}
    @procs = []
  end

  def define_server(shape)
    @config[shape] = Server.new
    yield @config[shape]
  end

  def steps(step, &block)
    @procs << { name: step, block: block }
  end

  def run(config, server)
    server.cpu = @config[config].cpu
    server.ssd = @config[config].ssd
    server.ram = @config[config].ram
    @procs.each do |step|
      step[:block].call(server)
    end
  end
end
