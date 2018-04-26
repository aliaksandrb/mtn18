
def task_2_1(n)
  (0..n-2).inject([0, 1]) { |fib| fib << fib.last(2).inject(:+) }
end

require 'yaml'

def task_2_2(input)
  array = []
  sub_hash = {}
  input.each do |key, value|
    sub_hash = parse_values(value)
    array << { key.to_sym => sub_hash }
  end
  array
end

def parse_values(value)
  pool = 1
  timeout = 1
  sub_hash = {}
  value.each do |sub_key, sub_value|
    case sub_key
    when 'database'
      sub_hash.store('db'.to_sym, sub_value)
    when 'username'
      sub_hash.store('user'.to_sym, sub_value)
    when 'password'
      sub_hash.store('password'.to_sym, sub_value)
    when 'timeout'
      timeout = sub_value
    when 'pool'
      pool = sub_value
    else
      'I have no idea what to do with that, look at code and fix it!'
    end
  end
  sub_hash.store('magic_number'.to_sym, pool * timeout)
  sub_hash
end

def task_2_3(array)
  array.flatten.uniq.sort_by(&:-@)
end

class String
  def palindrome?
    casecmp(reverse).zero?
  end
end

def task_2_4(string)
  string.palindrome?
end
