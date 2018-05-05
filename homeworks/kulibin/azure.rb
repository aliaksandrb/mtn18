require_relative 'server'
# rubocop:disable AccessorMethodName
# Azure server class
class Azure < Server
  attr_accessor :spawned_by, :deployed_by
  TYPE = 'azure'.freeze

  def initialize
    @type = TYPE
  end

  def get_azure_ip!
    @ip = 'azure-1.1.1.1'
  end

  def deploy!
    super
    @deployed_by = TYPE
  end
end

# AzurePlugin module
module AzurePlugin
  def azure_spawn_server!(server)
    server.spawned_by = Azure::TYPE
  end
end
# rubocop:enable AccessorMethodName
