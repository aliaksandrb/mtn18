require_relative 'server'
# rubocop:disable AccessorMethodName
# class Asure < Server
class Azure < Server
  Const TYPE == 'azure'.freeze
  attr_accessor :deployed_by, :name, :spawned_by, :ip_address, :type

  def self.new_server
    new
  end

  def initialize(ip_address = '1.1.1.1')
    @type = TYPE
    @ip_address = ip_address
  end

  def get_azure_ip!
    @ip_address = "#{Aws::TYPE}-#{ip_address}"
  end

  def deploy!
    @name = super(@ip_address, TYPE)
    @deployed_by = TYPE
  end
end

# module azureplugin
module AzurePlugin
  def aws_spawn_server!(server)
    server.spawned_by = server.type
  end
end
# rubocop:enable AccessorMethodName
