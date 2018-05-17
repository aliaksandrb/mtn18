def task_2_1(n)
  return [n] if (0..1).cover? n
  result = []
  a = 1
  b = 1
  n.times do
    result << a
    a, b = b, a + b
  end
  result
end

require 'yaml'

def task_2_2(input)
  result = []
  return result if input == ''
  YAML.safe_load(input).each do |type, lab|
    temp = {}
    lab.each do
      temp[:db] = lab['database']
      temp[:user] = lab['username'] if lab.key?('username')
      temp[:password] = lab['password'] if lab.key?('password')
      my_pool = lab.key?('pool') ? lab['pool'] : 1
      my_timeout = lab.key?('timeout') ? lab['timeout'] : 1000
      temp[:magic_number] = (my_pool * my_timeout)
    end
    result << Hash[type.to_sym, temp]
  end
  result
end

def task_2_3(array)
  array.flatten.sort.reverse.uniq
end

def task_2_4(string)
  boolean = true
  boolean = false unless string.downcase.reverse == string.downcase
  boolean
end
