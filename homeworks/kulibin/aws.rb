#!/usr/bin/env ruby

require_relative 'server'

# Aws class description
class Aws < Server
  TYPE = 'aws'.freeze

  def initialize
    @type = TYPE
  end

  # rubocop:disable AccessorMethodName
  def get_aws_ip!
    @ip = 'aws-2.2.2.2'
  end
  # rubocop:enable AccessorMethodName

  def deploy!
    super
    @deployed_by = TYPE
  end
end

# some documentation so that rubocop doesn't swear on me
module AwsPlugin
  def aws_spawn_server!(some_server)
    some_server.spawned_by = Aws::TYPE
  end
end

ser = Aws.new
ser.ip = '1.1.1.1'
p ser.deploy!
p ser.name

aws = Aws.new_server
p aws
