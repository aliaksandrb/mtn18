require_relative 'aws'
require_relative 'azure'

# Kulibin class
class Kulibin
  include AzurePlugin
  include AwsPlugin
  attr_accessor :version

  def initialize
    @procs = []
    @img_conf = {}
  end

  def self.setup
    setup = new
    block_given? ? yield(setup) && setup : 'no block'
  end

  def define_server(name_img)
    img_config = Server.new_server
    if block_given?
      yield(img_config)
      @img_conf = @img_conf.merge(name_img => img_config)
    else
      puts 'no block'
    end
  end

  def steps(_name_deploy, &steps)
    @procs << steps.to_proc
  end

  def run(name_img, server)
    server.cpu = @img_conf.dig(name_img).cpu
    server.ram = @img_conf.dig(name_img).ram
    server.ssd = @img_conf.dig(name_img).ssd
    @procs.each do |run|
      run.call(server)
    end
  end
end
