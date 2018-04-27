require 'benchmark'

def generate_proc_object
  proc { 'return from foo from inside proc' }
end

def task_3_1(generate_proc_object)
  time = Benchmark.measure do
    generate_proc_object
  end
  (time.real.to_f * 1_000_000).round(1)
end

def task_3_2(array, digit = 0)
  array.map! { |v| yield(v) } if block_given?
  array.inject(digit) { |sum, x| sum + x }
end

def task_3_3(range)
  counter = 0
  array = []
  range.each do |k|
    modulus = k.modulo 7
    if modulus == 3 && k > 7 && counter.zero?
      array << k
      counter += 1
    end
  end
  array
end

def task_3_4(_first, _second, *args)
  if block_given?
    args.each { |v| yield(v) }
  else
    puts 'ERROR'
  end
end

def task_3_5(array)
  result = []
  array.each do |element|
    result << element if yield(element) == true
  end
  result
end

def task_3_6(string)
  result = []
  array = string.split("\n")
  if !block_given?
    result = string
  else
    array.each do |element|
      result << yield(element)
    end
  end
  result
end