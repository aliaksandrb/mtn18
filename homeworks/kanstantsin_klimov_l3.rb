def task_3_1(pr)
  start = Time.now
  pr.call
  (Time.now - start).round(1)
end
# p task_3_1(proc { sleep(1) })

def task_3_3(range)
  range.each do |num|
    return num if num.to_s.length == 3 && num % 7 == 3 && num > 0
  end
  # if range.is_a? Range
end

def task_3_5(array)
  array.select { |i| yield i }.select(&:even?) if block_given?
end

def task_3_6(string)
  result = []
  block_given? ? string.split("\n").each { |str| result << (yield str) } : (return string)
  result
end

def task_3_2(array, *num)
  array.map! { |i| yield i } if block_given?
  array += num unless num.empty?
  array.inject(0) { |sum, x| sum + x }
end

def task_3_4(_a, _b, *args)
  block_given? ? args.each { |el| yield el } : 'ERROR'
end
