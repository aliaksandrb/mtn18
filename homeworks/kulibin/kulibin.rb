require_relative 'aws'
require_relative 'azure'

# This class starts instances
class Kulibin
  include AwsPlugin
  include AzurePlugin
  attr_accessor :version

  def initialize
    @config = {}
    @steps = []
  end

  def self.setup
    kulibin = Kulibin.new
    yield kulibin
    kulibin
  end

  def define_server(shape)
    @config[shape] = Server.new
    yield @config[shape]
  end

  def steps(_step_name, &block)
    @steps << block.to_proc
  end

  def run(shape, server)
    server.cpu = @config[shape].cpu if @config[shape].cpu
    server.ssd = @config[shape].ssd if @config[shape].ssd
    server.ram = @config[shape].ram if @config[shape].ram
    @steps.each do |serv|
      serv.call(server)
    end
  end
end
