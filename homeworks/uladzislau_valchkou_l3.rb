#!/bin/env ruby

def task_3_1(proc)
  begin_time = Time.now
  proc.call
  res = (Time.now - begin_time).round(1)
  res
end

def task_3_2(array, var = 0)
  if block_given?
    my_array = []
    array.each do |n|
      my_array << yield(n)
    end
    res = my_array.sum + var
  else
    res = array.sum + var
  end
  res
end

def task_3_3(range)
  range.find { |n| n.to_s.size == 3 && n % 7 == 3 && n > 0 }
end

def task_3_4(_arg1, _arg2, *arg)
  if block_given?
    arg.each do |v|
      yield(v)
    end
  else
    'ERROR'
  end
end

def task_3_5(array)
  my_array = []
  array.each do |n|
    if yield(n) == true
      my_array << n if n.even?
    end
  end
  my_array
end

def task_3_6(string)
  my_array = []
  if block_given?
    string.each_line do |n|
      my_array << yield(n)
    end
    my_array
  else
    string
  end
end
