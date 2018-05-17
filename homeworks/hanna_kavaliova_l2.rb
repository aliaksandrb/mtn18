#!/usr/bin/env ruby .

# Task1
def task_2_1(n)
  array = []
  array << 0 if n == 0
  perv = 0
  b = 1
  n.times do
    iteration_c = perv
    perv = b
    b = iteration_c + perv
    array << perv
  end
  array
end

# Task2
def task_2_2(input)
  require 'yaml'
  dump = YAML.safe_load(input)
  final = []
  return final if input.empty?
  dump.each do |k, v|
    dictionary = {}
    dictionary[:db] = v['database']
    dictionary[:user] = v['username'] if v.key?('username')
    dictionary[:password] = v['password'] if v.key?('password')
    pl = 1
    pl = v['pool'] if v.key?('pool')
    tt = 1000
    tt = v['timeout'] if v.key?('timeout')
    dictionary[:magic_number] = (pl * tt)
    final << { k.to_sym => dictionary }
  end
  final
end

# Task3
def task_2_3(input)
  input.flatten.uniq.sort.reverse
end

# Task 4
def task_2_4(input)
  input.to_s.downcase == input.to_s.downcase.reverse
end
