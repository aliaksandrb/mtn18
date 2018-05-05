require 'stringio'
require "minitest/autorun"
require_relative "test_helper"

class Script
  def self.run
    puts 'original'
  end
end

loaded = get_solution_file(5)

if loaded
  class TestHW5 < Minitest::Test
    def test_true
      assert_equal true, true
    end

    def test_wrapper_defined
      assert defined? SuperScript
    end

    def test_wrapper_inherit_original
      assert SuperScript < Script
    end

    def test_run_method_accepts_block_1
      string_io = StringIO.new
      $stdout = string_io
      SuperScript.run(name: 'test') { puts "hello" }
      $stdout = STDOUT
      assert_match(/\Aoriginal\nhello\n.+ test \n/, string_io.string, "should call a block")
    end

    def test_run_method_accepts_block_2
      string_io = StringIO.new
      $stdout = string_io
      a = [1]
      SuperScript.run(name: 'test') { a << 5; a.shift }
      $stdout = STDOUT
      assert_equal [5], a, "should call a block"
      assert_match(/\Aoriginal\n.+ test 1\n/, string_io.string, "should call a block")
    end

    def test_run_method_accepts_block_3
      string_io = StringIO.new
      $stdout = string_io
      SuperScript.run(name: 'xxx') { }
      $stdout = STDOUT
      assert_match(/\Aoriginal\n.+ xxx \n/, string_io.string, "should call a block")
    end

    def test_run_errors
      string_io = StringIO.new
      $stdout = string_io
      SuperScript.run(name: 'error') { 1 / 0 }
      $stdout = STDOUT
      assert_match(/\Aoriginal\nERROR: .+ error divided by 0\n/, string_io.string, "should handle errors")
    end

    def test_homeworks_examples_1
      string_io = StringIO.new
      $stdout = string_io
      SuperScript.run(name: 'mtn') { a = 1; a += 5; a }
      $stdout = STDOUT
      assert_match(/\Aoriginal\n.+ mtn 6\n/, string_io.string, "should call block")
    end

    def test_homeworks_examples_2
      string_io = StringIO.new
      $stdout = string_io
      SuperScript.run(name: 'mtn') { 1 / 0 }
      $stdout = STDOUT
      assert_match(/\Aoriginal\nERROR:.+ mtn divided by 0\n/, string_io.string, "should handle errors")
    end

    def teardown
      out = './out.log'
      err = './err.log'
      File.delete(out)if File.exist?(out)
      File.delete(err)if File.exist?(err)
    end

    def test_good_file
      string_io = StringIO.new
      $stdout = string_io
      a = [1]
      out = './out.log'
      SuperScript.run(name: 'file', stdout_log: out) { a << 5; a.shift }
      $stdout = STDOUT
      assert_equal [5], a, "should call a block"
      assert_match(/\Aoriginal\n/, string_io.string, "should call a block")
      assert_match(/\A.+ file 1/, IO.read(out),"should write to file")
    end

    def test_good_bad
      string_io = StringIO.new
      $stdout = string_io
      a = [1]
      err = './err.log'
      SuperScript.run(name: 'file', stderr_log: err) { a  / 123 }
      $stdout = STDOUT
      assert_match(/\Aoriginal\n/, string_io.string, "should call a block")
      assert_match(/\AERROR:.+ file undefined method \`\/\' for \[1\]\:Array/, IO.read(err),"should write to file")
    end
  end
end
