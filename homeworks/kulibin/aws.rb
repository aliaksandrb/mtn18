require_relative 'server'
# rubocop:disable AccessorMethodName

# just AwsPlugin which implement aws_spawn_server
module AwsPlugin
  def aws_spawn_server!(server)
    server.spawned_by = server.type
  end
end

# just Aws class which extends Sever class
class Aws < Server
  TYPE = 'aws'.freeze
  attr_reader :name
  attr_writer :name
  # cpu
  attr_reader :cpu
  attr_writer :cpu
  # ram
  attr_reader :ram
  attr_writer :ram
  # ssd
  attr_reader :ssd
  attr_writer :ssd
  # spawned_by
  attr_reader :spawned_by
  attr_writer :spawned_by
  attr_reader :deployed_by
  attr_writer :deployed_by
  attr_reader :ip
  attr_accessor :type

  def self.new_server
    new
  end

  def initialize
    @type = TYPE
  end

  def generate_ip
    '2.2.2.2'
  end

  def deploy!
    @name = super(@ip, TYPE)
    @deployed_by = TYPE
  end

  def get_aws_ip!
    @ip = generate_ip
    @ip = "#{Aws::TYPE}-#{ip}"
  end
end
# rubocop:enable AccessorMethodName
