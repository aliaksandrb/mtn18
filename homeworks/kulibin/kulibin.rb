require_relative 'aws'
require_relative 'azure'

# interest class Kulibin
class Kulibin
  attr_reader :version
  attr_writer :version

  include AwsPlugin
  include AzurePlugin

  def self.setup
    new_object = new
    yield(new_object)
    new_object
  end

  def initialize
    @steps = []
    @configuration_of_servers = {}
  end

  def steps(_name_of_step, &body_block)
    @steps.push(body_block.to_proc)
  end

  def define_server(token)
    new_obj = Server.new
    yield(new_obj)
    @configuration_of_servers = @configuration_of_servers.merge(
      token => new_obj
    )
  end

  def run(what_iron, what_server)
    # detect what what_iron has been trasferred in parameter
    what_server.cpu = @configuration_of_servers[what_iron].cpu
    what_server.ram = @configuration_of_servers[what_iron].ram
    what_server.ssd = @configuration_of_servers[what_iron].ssd
    @steps.each do |step|
      step.call(what_server)
    end
  end
end
