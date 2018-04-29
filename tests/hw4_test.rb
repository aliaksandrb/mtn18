require 'stringio'
require "minitest/autorun"

def get_solution_file(*args)
  home_dir = File.join(File.dirname(__FILE__), "..", "homeworks", "kulibin")
  solutions = Dir.entries(home_dir) & args
  if solutions.size != 4
    puts "!!! Can not find required solutions files !!!"
    puts "!!! Tests for homework_4 will be skipped !!!"
    return false
  end

  solutions.each do |solution|
    puts "loading solution: #{solution}"
    require_relative File.join(home_dir, solution)
    puts "loading solution: done"
  end
end

loaded = get_solution_file(*%w(server.rb azure.rb aws.rb kulibin.rb))

if loaded
  class TestHW4 < Minitest::Test
    def test_true
      assert_equal true, true
    end

    def test_server_exists
      assert defined?(Server)
    end

    def test_server_constant
      assert_equal "base", Server::TYPE
    end

    def test_server_default_init
      s = Server.new
      assert_equal "base", s.type
      assert_nil s.cpu
      assert_nil s.ram
      assert_nil s.ssd
      assert_nil s.name
      assert_nil s.ip
    end

    def test_server_deploy
      s = Server.new
      s.deploy!
      assert_equal "-base", s.name
      s.ip = "test"
      s.deploy!
      assert_equal "test-base", s.name
    end

    def test_server_ping
      s = Server.new
      s.cpu = 4
      assert s.ping
      s.cpu = 0
      assert s.ping
      s.cpu = 3
      refute s.ping
    end

    def test_aws
      assert defined?(Aws)
    end

    def test_aws_constant
      assert_equal "aws", Aws::TYPE
    end

    def test_get_aws_ip!
      s = Aws.new
      assert_nil s.ip
      s.get_aws_ip!
      assert_equal "aws-2.2.2.2", s.ip
    end

    def test_aws_deploy
      s = Aws.new
      s.deploy!
      assert_equal "-aws", s.name
      s.ip = "test"
      s.deploy!
      assert_equal "test-aws", s.name
      assert_equal "aws", s.deployed_by
    end

    def test_aws_plugin
      assert defined?(AwsPlugin)
    end

    def test_aws_plugin_spawner
      s = Aws.new
      assert_nil s.spawned_by
      mock = Object.new
      mock.extend(AwsPlugin)
      mock.aws_spawn_server!(s)
      assert_equal "aws", s.spawned_by
    end

    def test_kulibin
      assert defined?(Kulibin)
    end

    def new_kulibin
      kulibin = Kulibin.setup do |config|
        config.version = 2

        config.define_server :test do |s|
          s.cpu = 4
          s.ram = 1024
          s.ssd = 512
        end

        config.define_server :test_max do |s|
          s.cpu = 10
          s.ram = 1024
          s.ssd = 1024
        end

        config.steps :setup do |server|
          case server.type
          when 'aws'
            server.get_aws_ip!
            config.aws_spawn_server!(server)
          when 'azure'
            server.get_azure_ip!
            config.azure_spawn_server!(server)
          else
            nil
          end
        end

        config.steps :deploy do |server|
          server.deploy!
        end

        config.steps :status do |server|
          if server.ping
            puts "deploy succeed!. running instance: #{server.name}"
          else
            puts "unable to ping server: #{server.name}"
          end
        end
      end

      kulibin
    end

    def test_kulibin_version
      assert_equal 2, new_kulibin.version
    end

    def test_kulibin_aws
      aws = Aws.new_server
      new_kulibin.run :test, aws

      assert_equal "aws", aws.type
      assert_equal 4, aws.cpu
      assert_equal 1024, aws.ram
      assert_equal 512, aws.ssd
      assert_equal "aws-2.2.2.2", aws.ip
      assert_equal "aws", aws.spawned_by
      assert_equal "aws-2.2.2.2-aws", aws.name
      assert_equal "aws", aws.deployed_by
    end

    def test_kulibin_azure
      azure = Azure.new_server
      new_kulibin.run :test_max, azure

      assert_equal "azure", azure.type
      assert_equal 10, azure.cpu
      assert_equal 1024, azure.ram
      assert_equal 1024, azure.ssd
      assert_equal "azure-1.1.1.1", azure.ip
      assert_equal "azure", azure.spawned_by
      assert_equal "azure-1.1.1.1-azure", azure.name
      assert_equal "azure", azure.deployed_by
    end


    def test_kulibin_other
      kulibin = Kulibin.setup do |config|
        config.version = 5

        config.define_server :mini do |s|
          s.cpu = 1
          s.ram = 1
          s.ssd = 1
        end

        config.steps :setup do |server|
          server.ip = '6.6.6.6'
          server.cpu = 5
          server.ssd = 5

          case server.type
          when 'aws'
            server.deployed_by = 'test-aws'
          when 'azure'
            server.deployed_by = 'test-azure'
          end
        end

        config.steps :run do |server|
          server.name = "#{server.type}-run"
        end

        config.steps :ping do |server|
          if server.ping
            server.name += '-even'
          else
            server.name += '-odd'
          end
        end
      end

      aws = Aws.new_server
      azure = Azure.new_server

      kulibin.run :mini, aws
      kulibin.run :mini, azure


      assert_equal '6.6.6.6', aws.ip
      assert_equal '6.6.6.6', azure.ip
      assert_equal 1, aws.ram
      assert_equal 1, azure.ram
      assert_equal 5, aws.cpu
      assert_equal 5, azure.cpu

      assert_equal 'test-aws', aws.deployed_by
      assert_equal 'test-azure', azure.deployed_by

      assert_equal 'aws-run-odd', aws.name
      assert_equal 'azure-run-odd', azure.name
    end
  end
end
