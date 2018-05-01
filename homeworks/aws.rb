require_relative 'server'
# rubocop:disable AccessorMethodName
# class AWS < Server
class Aws < Server
  Const TYPE == 'aws'.freeze
  attr_accessor :deployed_by,
                :name,
                :spawned_by,
                :ip_address,
                :type

  def self.new_server
    new
  end

  def initialize(ip_address = '2.2.2.2')
    @type = TYPE
    @ip_address = ip_address
  end

  def get_aws_ip!
    @ip_address = "#{Aws::TYPE}-#{ip_address}"
  end

  def deploy!
    @name = super(@ip_address, TYPE)
    @deployed_by = TYPE
  end
end

# module awsplugin
module AwsPlugin
  def aws_spawn_server!(server)
    server.spawned_by = server.type
  end
end
# rubocop:enable AccessorMethodName