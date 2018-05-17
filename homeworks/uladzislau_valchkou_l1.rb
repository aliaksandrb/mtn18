#!/bin/env ruby

def task_1(input)
  task_result = ''
  input.each_line do |line|
    if line.downcase.include? 'error'
      task_result << line
    end
  end
  task_result[0..-2]
end

def task_2(input)
  task_result = []
  input.each_line do |line|
    unless line.downcase.include? 'error'
      a = line.split('[')[1].split(']')[0]
      b = line.split('-')[0]
      c = line.upcase.split('"')[1].split(' ')
      if c.length == 3
        c = c[1]
      else
        c = ""
      end
      unless a.empty? || b.empty? || c.empty?
        task_result << a + ' FROM: ' + b + 'TO: ' + c
      end
    end
  end
  task_result
end

def task_3(input)
  require 'time'
  previous_time = nil
  difference = []
  input.each_line do |line|
    if line.include? 'Calling core with action'
      line_arr = line.split(' ')[0] + ' ' + line.split(' ')[1]
      time_in_ms = DateTime.strptime(line_arr, '%Y-%m-%d %H:%M:%S.%L').to_time
      difference << (time_in_ms - previous_time).round(1) if previous_time
      previous_time = time_in_ms
    end
  end
  difference[0]
end

def task_4(input)
  summ = 0
  input.each_char { |c| summ += c.to_i }
  summ
end

