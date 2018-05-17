#!/usr/bin/env ruby
require 'yaml'

def task_2_1(n)
  result = []
  return [n] if (0..1).cover? n
  a = b = 1
  n.times do
    result << a
    a, b = b, a + b
  end
  result
end

def task_2_3(arr)
  arr.flatten.uniq.sort.reverse
end

def task_2_2(str, pool = 1, timeout = 1000)
  output = []
  if !str.empty? && !str.nil?
    str = YAML.safe_load(str)
    str.each do |k, v|
      pool = v['pool'] if v['pool'].is_a? Numeric
      timeout = v['timeout'] if v['timeout'].is_a? Numeric
      magic_number = pool * timeout
      hash = Hash[db: v.dig('database'),\
                  adapter: v.dig(:adapter),
                  encoding: v.dig(:encoding),
                  reconnect: v.dig(:reconnect),
                  user: v.dig('username'),
                  password: v.dig('password'),
                  socket: v.dig(:socket),
                  magic_number: magic_number].compact!
      output << Hash[k.to_sym, hash]
    end
  end
  output
end

def task_2_4(str)
  str.downcase == str.downcase.reverse
end
