# rubocop:disable AccessorMethodName
require_relative './server.rb'
# Plugin AWS
module AwsPlugin
  def aws_spawn_server!(server)
    server.spawned_by = Aws::TYPE
  end
end

# AWS < Server
class Aws < Server
  TYPE = 'aws'.freeze

  def get_aws_ip!
    @ip = 'aws-2.2.2.2'
  end

  def deploy!
    super
    @deployed_by = TYPE
  end
end
# rubocop:enable AccessorMethodName
