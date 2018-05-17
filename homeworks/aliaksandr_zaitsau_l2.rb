# #############task_2_1#################

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

# ############task_2_2#################

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

# ###################task_2_3##########################

def task_2_3(input)
  input.flatten.sort.uniq.reverse
end

# ###################task_2_4#######################

def task_2_4(variable)
  variable.downcase.reverse == variable.downcase
end
