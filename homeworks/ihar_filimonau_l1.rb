#!/usr/bin/env ruby

# +++++++++++++++++++
#  First task code  +
# +++++++++++++++++++
def task_1(input)
  output_list = []
  input.each_line do |line|
    output_list.push line[0...-1] if line.downcase.include? 'error'
  end
  output_list[0].to_s
end

def task_2(input)
  full_regexp = /(?:\d{1,3}\.){3}\d{1,3} - - \[(.*?)\] "POST \/.* HTTP\/.*/
  date_regexp = /\[(.*?)\]/
  ip_regexp = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/
  post_regexp = /\s\/.*?\s/
  output_list = []
  input.each_line do |line|
    if line =~ full_regexp
      unless line.downcase.include? 'error'
        output_list.push line.scan(date_regexp)[0][0].to_s + " FROM: #{line.scan(ip_regexp)[0]} TO:#{line.scan(post_regexp)[0][0...-1]}".upcase
      end
    end
  end
  output_list
end

# +++++++++++++++++++
#  Second task code +
# +++++++++++++++++++
def task_3(input)
  require 'time'
  tmp_list = []
  time_regex = /(\d+-\d+-\d+ \d+:+\d+:\d+.\d)/
  input.each_line do |line|
    reg = line.scan(time_regex)[0][0]
    tmp_list.push Time.parse(reg) if line.include? 'Calling core'
  end
  tmp_list[1] - tmp_list[0]
end

# +++++++++++++++++++
#  Third task code  +
# +++++++++++++++++++
def task_4(input)
  sum = 0
  input.each_char do |letter|
    sum += letter.to_i if letter.to_i.is_a? Integer
  end
  sum
end
