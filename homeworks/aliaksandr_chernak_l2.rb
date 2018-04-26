#!/usr/bin/env ruby
# develop by Aliaksandr Chernak

def task_2_1(febon, xxx = 0, yyy = 1, res = [], ddd = [0])
  febon.times do
    xxx, yyy = yyy, xxx + yyy
    res << xxx
  end
  febon != 0 ? res : ddd
end

def task_2_2(vvv, rrr = [])
  return rrr if vvv == ''
  require 'yaml'
  YAML.safe_load(vvv).each do |k, v|
    rrr << { k.to_sym =>
     { db: v.dig('database'), user: v.dig('username'), password: v.dig('password'),
       magic_number: (v.dig('pool') || 1) * (v.dig('timeout') || 1000) }.compact }
  end
  rrr
end

def task_2_3(array)
  array.flatten.uniq.sort.reverse
end

def task_2_4(string)
  string.downcase == string.downcase.reverse
end
