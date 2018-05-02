#!/usr/bin/env ruby
# rubocop:disable AccessorMethodName
require_relative 'server'
# module comment
module AzurePlugin
  def azure_spawn_server!(server)
    server.spawned_by = Azure::TYPE
  end
end
# comment
class Azure < Server
  TYPE = 'azure'.freeze

  def self.new_server
    new
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
