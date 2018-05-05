#!/usr/bin/env ruby .

# rubocop:disable AccessorMethodName

require_relative './server.rb'

# configured as a module
module AwsPlugin
  def aws_spawn_server!(server)
    server.spawned_by = Aws::TYPE
  end
end

# AWS-class
class Aws < Server
  include AwsPlugin
  TYPE = 'aws'.freeze

  def get_aws_ip!
    @ip = 'aws-2.2.2.2'
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
