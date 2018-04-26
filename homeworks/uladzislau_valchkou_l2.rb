#!/bin/env ruby

require 'yaml'

def task_2_1(n)
  values = []
  if n == 0
    values << 0
  else
    a = 0
    b = 1
    n.times do
      c = a
      a = b
      b = c + a
      values << a
    end
  end
  values
end

def task_2_2(input)
  my_array = []
  if input == ''
    my_array.nil?
  else
    my_hash = YAML.safe_load(input)
    my_hash.each do |group, hash|
      group_hash = {}
      group_hash[:db] = hash['database']
      group_hash[:user] = hash['username'] if hash.key?('username')
      group_hash[:password] = hash['password'] if hash.key?('password')
      pool = hash['pool'] || 1
      timeout = hash['timeout'] || 1000
      group_hash[:magic_number] = pool * timeout
      my_array << { group.to_sym => group_hash }
    end
  end
  my_array
end

def task_2_3(array)
  a = array.flatten.uniq.sort { |x, y| y <=> x }
  a
end

def task_2_4(string)
  a = string.downcase == string.downcase.reverse
  a
end
