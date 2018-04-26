#!/usr/bin/env ruby

def task_2_1(n)
  return [n] if (0..1).cover? n
  result = []
  a = 1
  b = 1
  n.times do
    result << a
    a, b = b, a + b
  end
  result
end

require 'yaml'

def task_2_2(input)
  result = []
  return result if input == ''
  YAML.safe_load(input).each do |type, ops|
    temp = {}
    ops.each do
      temp[:db] = ops['database']
      temp[:user] = ops['username'] if ops.key?('username')
      temp[:password] = ops['password'] if ops.key?('password')
      my_pool = ops.key?('pool') ? ops['pool'] : 1
      my_timeout = ops.key?('timeout') ? ops['timeout'] : 1000
      temp[:magic_number] = (my_pool * my_timeout)
    end
    result << Hash[type.to_sym, temp]
  end
  result
end

def task_2_3(input)
  input.flatten.uniq.sort.reverse
end

def task_2_4(string)
  string.downcase == string.downcase.reverse
end
