def task_3_1(input)
  st = Time.now
  input.call
  (Time.now - st).round(1)
end

def task_3_2(array, arg = 0)
  block_given? ? array.map { |elem| yield(elem) }.sum + arg : array.sum + arg
  # another way
  # array = array.map { |elem| yield(elem) } if block_given?
  # array.inject(0) { |res, elem| res + elem } + arg
end

def task_3_3(range)
  range.detect { |elem| elem if elem % 7 == 3 && elem.to_s.size == 3 && elem > 0 }
end

def task_3_4(_first, _second, *args)
  block_given? ? args.each { |elem| yield(elem) } : 'ERROR'
end

def task_3_5(array)
  array.select { |elem| yield(elem) }.find_all(&:even?)
  # Another way
  # res = []
  # array.each { |elem| res << elem if elem.even? && yield(elem) }
  # res
end

def task_3_6(string)
  block_given? ? string.split("\n").map { |words| yield(words) } : string
end
