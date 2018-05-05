#!/usr/bin/env ruby .

# rubocop:disable AccessorMethodName

require_relative './server.rb'

# configured as a module
module AzurePlugin
  def azure_spawn_server!(server)
    server.spawned_by = Azure::TYPE
  end
end

# azure class
class Azure < Server
  include AzurePlugin
  TYPE = 'azure'.freeze

  def get_azure_ip!
    @ip = 'azure-1.1.1.1'
  end

  def initialize
    @type = TYPE
  end

  def deploy!
    super
    @deployed_by = TYPE
  end
end

# rubocop:enable AccessorMethodName
