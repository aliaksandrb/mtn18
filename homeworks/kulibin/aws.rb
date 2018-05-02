require_relative 'server'
# rubocop:disable AccessorMethodName

# Aws server class (from the Server class)
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

# AwsPlugin module
module AwsPlugin
  def aws_spawn_server!(object)
    object.spawned_by = Aws::TYPE
  end
end
# rubocop:enable AccessorMethodName
