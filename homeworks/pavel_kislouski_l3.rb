# task_3_1
def task_3_1(receive)
  start_time = Time.now
  receive.call
  end_time = Time.now
  (end_time - start_time).round(1)
end

# task_3_2
def task_3_2(array, default_param = 0)
  summa = 0
  if block_given?
    array.each do |mas|
      summa += yield(mas)
    end
  else
    array.each do |mas|
      summa += mas
    end
  end
  summa + default_param
end

# task_3_3
def task_3_3(range)
  all = range.find_all { |e| e % 7 == 3 }
  result = all.find_all { |e| e >= 100 }
  result.min
end

# task_3_4
def task_3_4(_a, _b, *args)
  if block_given?
    args.count { |i| yield i }
    return nil if args == 0
  else
    'ERROR'
  end
end

# task_3_5
def task_3_5(array)
  result = []
  array.each { |n| (result << n if n.even?) if yield(n) }
  result
end

# task_3_6
def task_3_6(string)
  result = []
  block_given? ? string.split("\n").each { |e| result << yield(e) } : (return string)
  result
end
