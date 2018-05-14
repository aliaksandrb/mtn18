#!/usr/bin/env ruby

require_relative 'server'

# Azure class description
class Azure < Server
  TYPE = 'azure'.freeze

  def initialize
    @type = TYPE
  end

  # rubocop:disable AccessorMethodName
  def get_azure_ip!
    @ip = 'azure-1.1.1.1'
  end
  # rubocop:enable AccessorMethodName

  def deploy!
    super
    @deployed_by = TYPE
  end
end

# some documentation so that rubocop doesn't swear on me
module AzurePlugin
  def azure_spawn_server!(some_server)
    some_server.spawned_by = Azure::TYPE
  end
end
