require_relative 'server'
# rubocop:disable AccessorMethodName
# Azure server class (from the Server class)
class Azure < Server
  TYPE = 'azure'.freeze

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
    server.spawned_by = server.type
  end
end
# rubocop:enable AccessorMethodName
