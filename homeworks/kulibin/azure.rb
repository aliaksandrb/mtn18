require_relative 'server'
# rubocop:disable AccessorMethodName
# 'azure' class
class Azure < Server
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

# 'AzurePlugin' module
module AzurePlugin
  def azure_spawn_server!(server)
    server.spawned_by = Azure::TYPE
  end
end
# rubocop:enable AccessorMethodName
