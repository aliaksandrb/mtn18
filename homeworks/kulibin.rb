require_relative './aws.rb'
require_relative './azure.rb'
# Class top-level documentation comment
class Kulibin
  include ::AzurePlugin
  include ::AwsPlugin
  attr_accessor :version

  def initialize
    @conf = {}
    @steps = []
  end

  def self.setup
    kulibin = Kulibin.new
    yield(kulibin)
    kulibin
  end

  def define_server(conf)
    @conf[conf] = Server.new
    yield(@conf[conf])
  end

  def steps(step, &block)
    @steps << {
      name: step,
      block: block
    }
  end

  def run(conf, server)
    server = set_server_properties(conf, server)
    @steps.each do |step|
      step[:block].call(server)
    end
  end

  def set_server_properties(conf, server)
    server.cpu = @conf[conf].cpu if @conf[conf].cpu
    server.ssd = @conf[conf].ssd if @conf[conf].ssd
    server.ram = @conf[conf].ram if @conf[conf].ram
    server
  end
end
