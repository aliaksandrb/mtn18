require_relative 'server'
# rubocop:disable AccessorMethodName
# 'aws' class
class Aws < Server
  TYPE = 'aws'.freeze

  def initialize
    @type = TYPE
  end

  def get_aws_ip!
    @ip = 'aws-2.2.2.2'
  end

  def deploy!
    super
    @deployed_by = TYPE
  end
end

# 'AwsPlugin' module
module AwsPlugin
  def aws_spawn_server!(server)
    server.spawned_by = Aws::TYPE
  end
end
# rubocop:enable AccessorMethodName
