# Task_1
def task_3_1(pro, start = Time.now)
  pro.call
  (Time.now - start).round(1)
end

# Task_2
def task_3_2(array, value = 0)
  array = array.map { |v| yield v } if block_given?
  array.sum + value
end

# Task_3
def task_3_3(input)
  input.detect { |value| (value % 7 == 3) && (value.to_s.size == 3) && (value > 0) }
end

# Task_4
def task_3_4(_a, _b, *args)
  args.count { |i| yield i } if block_given?
  return 'ERROR' unless block_given?
  return nil if args == 0
end

# Task_5
def task_3_5(args)
  args.select { |n| yield n }.select(&:even?) if block_given?
end

# Task_6
def task_3_6(stg, d = [])
  block_given? ? stg.each_line { |f| d << yield(f) } : d = stg
  d
end
