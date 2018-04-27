#!/usr/bin/env ruby
# develop by Aliaksandr Chernak

def task_1(logs)
  result_error = ''
  logs.each_line { |log| result_error << log[0..-2] if log.downcase.include? 'error' }
  result_error
end

def task_2(logs)
  log_regex = %r{(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}) - - \[([^\]]+?)\] "(GET|POST|PUT|DELETE) ([^\s]+?) (HTTP\/1\.1)" (\d+)}
  result_parse = []
  logs.each_line do |log|
    parser = log.scan(log_regex)[0]
    next if log.scan(log_regex)[0].nil?
    upc = parser[3]
    parse = "#{parser[1]} FROM: #{parser[0]} TO: #{upc.upcase}"
    result_parse << parse
  end
  result_parse
end

require 'time'
def task_3(logs)
  log_regex = /(\d+-\d+-\d+ \d+:+\d+:\d+.\d) (\w+-\w+\[\d*\] \w+) - (\w+)/
  result_parse = []
  logs.each_line do |log|
    parser = log.scan(log_regex)[0]
    if parser[2] == 'Calling'
      parse = Time.parse(parser[0])
      result_parse << parse
    end
  end
  result_parse[1] - result_parse[0]
end

def task_4(smth)
  sum = 0
  smth.each_char { |symb| sum += symb.to_i }
  sum
end
