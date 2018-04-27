def task_3_1(input)
  start_time = Time.now
  input.call
  end_time = Time.now
  (end_time - start_time).round(1)
end

def task_3_2(array, digit = 0)
  array = array.map { |v| yield v } if block_given?
  array.sum + digit
end

def task_3_3(input)
  input.detect { |value| (value % 7 == 3) && (value.to_s.size == 3) && (value > 0) }
end

def task_3_4(_a, _b, *args)
  if block_given?
    args.count { |i| yield i }
    nil if args.empty?
  else
    'ERROR'
  end
end

def task_3_5(args)
  args.select { |n| yield n }.select(&:even?) if block_given?
end

def task_3_6(string)
  if block_given?
    string.split("\n").map { |e| yield(e) }
  else
    string
  end
end
