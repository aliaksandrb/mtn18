require_relative 'server'
# rubocop:disable AccessorMethodName

# Aws server class
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

# Aws plugin which adds spawned_by var
module AwsPlugin
  def aws_spawn_server!(object)
    object.spawned_by = Aws::TYPE
  end
end
# rubocop:enable AccessorMethodName
