
def fib_r(a, b, n)
  if n < 1000
    n == 0 ? a : fib_r(b, a + b, n - 1)
  else
    'hacked you'
  end
end

def fib(n)
  fib_r(0, 1, n)
end

def task_2_1(number)
  if number > 0
    (1..number).map { |n| fib(n) }
  elsif number.zero?
    [0]
  elsif number < 0
    []
  end
end

require 'yaml'

def task_2_2(input)
  array = []
  sub_hash = {}
  insert = YAML.safe_load input
  insert.each do |key, value|
    sub_hash = parse_values(value)
    array << { key.to_sym => sub_hash }
  end
  array
end


def parse_values(value)
  pool = 1
  timeout = 1000
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
    casecmp(reverse) == 0
  end
end

def task_2_4(string)
  string.palindrome?
end
