#!/usr/bin/env ruby

# task variables
# task_3_1_var = proc do
#  puts 'Hello, Ruby!'
# end
# task_3_2_var = [1, 2, 3, 4]
# task_3_3_var = (114..150)

# methods describing
def task_3_1(some_proc)
  start = Time.now
  some_proc.call
  finish = Time.now
  (finish - start).round(1)
end

def task_3_2(array, int = 0)
  array.map! { |v| yield(v) } if block_given?
  array.push int
  array.sum
end

def task_3_3(range)
  n = 7
  if range.max < 100
    p 'Range is not valid'
  else
    range.detect { |v| v % n == 3 if v > 99 }
  end
end

def task_3_4(_x, _y, *args)
  return 'ERROR' unless block_given?
  args.map { |v| yield(v) }
end

def task_3_5(array)
  out_list = []
  temp_list = array.select { |p| p if p.even? }
  temp_list.map { |v| out_list.push v if yield(v) }
  out_list
end

def task_3_6(string)
  if block_given?
    list = string.split("\n")
    list.map! { |v| yield(v) }
  else
    string
  end
end

# calling methods
# puts task_3_1 task_3_1_var
# p task_3_2(task_3_2_var) {|i| i**2}
# puts task_3_3 task_3_3_var
# p task_3_5([1, 2, 3, 4, 5, 6, 7]) { |i| i > 2}
# p task_3_4(1,2, 3,4,5) { |i| puts i }
# p task_3_6("hello\nmy\ncruel\nworld") { |line| line[0] }
