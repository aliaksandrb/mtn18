require_relative 'aws'
require_relative 'azure'

# class kulibin
class Kulibin
  attr_reader :version
  attr_writer :version

  include AwsPlugin
  include AzurePlugin

  def self.setup
    my_object = new
    yield(my_object)
    my_object
  end

  def initialize
    @steps = []
    @configure_serv = {}
  end

  def steps(_name_step, &my_block)
    @steps.push(my_block.to_proc)
  end

  def define_server(token)
    my_obj = Server.new
    yield(my_obj)
    @configure_serv = @configure_serv.merge(
      token => my_obj
    )
  end

  def run(param, my_server)
    my_server.cpu = @configure_serv[param].cpu
    my_server.ram = @configure_serv[param].ram
    my_server.ssd = @configure_serv[param].ssd
    @steps.each do |step|
      step.call(my_server)
    end
  end
end
