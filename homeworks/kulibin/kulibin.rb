require_relative 'aws'
require_relative 'azure'

# This class starts instances
class Kulibin
  include AwsPlugin
  include AzurePlugin
  attr_accessor :cpu, :ram, :ssd
  attr_accessor :version

  def initialize
    @size = {}
    @config = {}
  end

  def run(shape, server)
    server.cpu = @size[shape][:cpu]
    server.ram = @size[shape][:ram]
    server.ssd = @size[shape][:ssd]
    @config.each { |step| step[1].call(server) }
  end

  def self.setup
    kulibin = new
    yield kulibin
    kulibin
  end

  def define_server(shape)
    yield self
    @size[shape] = { cpu: @cpu, ram: @ram, ssd: @ssd }
  end

  def steps(step, &block)
    @config[step] = block
  end
end
