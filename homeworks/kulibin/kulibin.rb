require_relative 'aws'
require_relative 'azure'

# Kulibin class
class Kulibin
  include AzurePlugin
  include AwsPlugin
  attr_accessor :version, :cpu, :ram, :ssd

  def initialize
    @image = {}
    @config = []
  end

  def self.setup
    kuleben = Kulibin.new
    yield kuleben
    kuleben
  end

  def define_server(img)
    yield self
    @image[img] = { cpu: @cpu, ram: @ram, ssd: @ssd }
  end

  def steps(_type, &block)
    @config << block.to_proc
  end

  def run(img, name)
    name.cpu = @image[img][:cpu]
    name.ram = @image[img][:ram]
    name.ssd = @image[img][:ssd]
    @config.each { |e| e.call(name) }
  end
end
