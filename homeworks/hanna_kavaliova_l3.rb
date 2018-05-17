#!/usr/bin/env ruby .

# Task1
def task_3_1(object)
  # def benchmarking(object)
  t_st = Time.now
  object.call
  # show =
  (Time.now - t_st).round(1)
  # puts show
end
# benchmarking(object)
# def task_3_1(object)

# Task2
def task_3_2(array, var = 0)
  # def mega_sum(array, var = 0)
  if block_given?
    array.inject(0) { |s, increment| s + yield(increment) } + var
  else
    array.inject(0) { |s, increment| s + increment } + var
  end
end
# task_3_2(array)

# Task3
def task_3_3(range)
  # def find(range)
  given = range.find_all { |e| e % 7 == 3 }
  r = given.find_all { |e| e >= 100 }
  r.min
end
# find(range)
# task_3_3(range)

# Task4
def task_3_4(_arg1, _arg2, *args)
  # def method_name(_arg1, _arg2, *args)
  if block_given?
    args.each do |i|
      yield(i)
    end
  else
    'ERROR'
  end
end
# task_3_4(arg1, arg2, *args)

# Task5
def task_3_5(array)
  show = []
  return [] unless block_given?
  array.each do |i|
    next unless yield(i)
    show << i if i.even?
  end
  show
end
# task_3_5(array)

# Task6
def task_3_6(string)
  # def custom(string)
  array = []
  block_given? ? string.each_line { |i| array << yield(i) } : (return string)
  array
end
# task_3_6(_string)
