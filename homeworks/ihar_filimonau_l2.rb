#!/usr/bin/env ruby

def task_2_1(n)
  fib1 = 0
  fib2 = 1
  out_list = []
  if n == 0
    out_list.push n
  else
    n.times do
      out_list.push fib2
      fib1, fib2 = fib2, fib1 + fib2
    end
  end
  out_list
end

def task_2_2(input)
  require 'yaml'
  tmp_list = []
  some_yml = YAML.safe_load(input)
  return tmp_list if input == ''
  some_yml.each do |key, value|
    output = Hash[]
    value.each do
      output[:db] = value['database']
      output[:user] = value['username'] if value.key? 'username'
      output[:password] = value['password'] if value.key? 'password'
      output[:magic_number] = (value['pool'] || 1) * (value['timeout'] || 1000)
    end
    tmp_list.push(key.to_sym => output)
  end
  tmp_list
end

def task_2_3(array)
  array.flatten.uniq.sort.reverse
end

def task_2_4(string)
  string.downcase.reverse == string.downcase
end
