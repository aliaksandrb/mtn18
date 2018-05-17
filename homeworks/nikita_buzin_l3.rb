# ####################################
# TASK1
# ####################################
def task_3_1(pr)
  start = Time.now
  pr.call
  finish = Time.now
  (finish - start).round(1)
end

# ####################################
# TASK2
# ####################################
def task_3_2(array, x = 0)
  array = array.map { |i| yield i } if block_given?
  array.sum + x
end

# ####################################
# TASK3
# ####################################
def task_3_3(range)
  all = range.find_all { |e| e % 7 == 3 }
  result = all.find_all { |e| e >= 100 }
  result.min
end

# ####################################
# TASK4
# ####################################
def task_3_4(_a, _b, *args)
  args.count { |i| yield i } if block_given?
  return 'ERROR' unless block_given?
  return nil if args == 0
end

# ####################################
# TASK5
# ####################################
def task_3_5(array)
  all = array.select { |i| yield i } if block_given?
  all.find_all { |i| yield i }.select(&:even?)
end

# ####################################
# TASK6
# ####################################
def task_3_6(string)
  return string.split("\n").map { |i| yield i } if block_given?
  string unless block_given?
end
