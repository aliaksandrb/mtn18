require_relative 'aws'
require_relative 'azure'

# Kulibin call and make configure
class Kulibin
  include AwsPlugin
  include AzurePlugin
  attr_accessor :cpu,
                :ram,
                :version

  def initialize
    @collection = {}
    @configuration = {}
  end

  def self.setup
    kulibin = new
    yield kulibin
    kulibin
  end

  def run(shake, server)
    server.cpu = @collection[shake][:cpu]
    server.ram = @collection[shake][:ram]
    @configuration.each { |step| step[1].call(server) }
  end

  def define_server(shake)
    yield self
    @collection[shake] = { cpu: @cpu, ram: @ram }
  end

  def put(unit, &block)
    @collection[unit] = block
  end
end
