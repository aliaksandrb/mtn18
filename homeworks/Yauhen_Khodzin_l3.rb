#!/usr/bin/env ruby

# task_3_1
def task_3_1(receive)
  t_begin = Time.now
  receive.call
  (Time.now - t_begin).round(1)
end

# task_3_2
def task_3_2(array, addition = 0)
  # block_given? ? array = array.map { |arr| yield(arr)} : nil
  array = array.map { |arr| yield(arr) } if block_given?
  array.sum + addition
end

# task_3_3
def task_3_3(range)
  return [] if range.last <= 100 || range.first >= 998
  i = range.first > 100 ? range.first : 101
  i += 1 while i % 7 != 3
  i
end

# task_3_4
def task_3_4(_one, _two, *ops)
  block_given? ? ops.each { |e| yield(e) } : (return 'ERROR')
end

# task_3_5
def task_3_5(array)
  result = []
  array.each { |e| (result << e if e.even?) if yield(e) }
  result
end

# task_3_6
def task_3_6(string)
  result = []
  block_given? ? string.split("\n").each { |e| result << yield(e) } : (return string)
  result
end
