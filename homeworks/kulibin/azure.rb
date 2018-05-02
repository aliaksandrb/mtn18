# rubocop:disable AccessorMethodName
require_relative 'server'

# AzurePlugin
module AzurePlugin
  def azure_spawn_server!(server)
    server.spawned_by = Azure::TYPE
  end
end

# Azure class
class Azure < Server
  include AzurePlugin
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
# rubocop:enable AccessorMethodName
