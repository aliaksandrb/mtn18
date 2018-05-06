# rubocop:disable AccessorMethodName
require_relative './server.rb'
# Plugin Azure
module AzurePlugin
  def azure_spawn_server!(server)
    server.spawned_by = Azure::TYPE
  end
end

# Azure < Server
class Azure < Server
  TYPE = 'azure'.freeze

  # set ip
  def get_azure_ip!
    @ip = 'azure-1.1.1.1'
  end

  def deploy!
    super
    @deployed_by = TYPE
  end
end
# rubocop:enable AccessorMethodName
