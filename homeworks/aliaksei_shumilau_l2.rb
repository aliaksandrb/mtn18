#######################################################
# Task_2.1 Fibonacci_numbers
def task_2_1(n)
  return [n] if (0..1).cover? n
  result = []
  x = 1
  z = 1
  n.times do
    result << x
    x, z = z, x + z
  end
  result
end

######################################################
# Task_2.3 Yaml_parcing
def task_2_2(input)
  require 'yaml'
  output = []
  return output if input == ''
  YAML.safe_load(input).each do |key, value|
    data = {}
    value.each do
      data[:db] = value['database']
      data[:user] = value['username'] if value.include?('username')
      data[:password] = value['password'] if value.include?('password')
      my_pool = value.key?('pool') ? value['pool'] : 1
      my_timeout = value.key?('timeout') ? value['timeout'] : 1000
      data[:magic_number] = (my_pool * my_timeout)
    end
    output << Hash[key.to_sym, data]
  end
  output
end

######################################################
# Task_2.3 Returning an array
def task_2_3(array)
  array.flatten.uniq.sort.reverse
end

######################################################
# Task_2.4 The row palindrome
def task_2_4(string)
  string = string.downcase.scan(/\w/)
  string == string.reverse
end
