# ####################################
# TASK1
# ####################################
def task_2_1(n)
  if (0..1).cover? n
    [n]
  else
    result = []
    a = 1
    b = 1
    n.times do
      result << a
      temp = a
      a = b
      b = temp + b
    end
    result
  end
end

# ####################################
# TASK2
# ####################################
def task_2_2(input)
  require 'yaml'
  result = []
  return result if input == ''
  YAML.safe_load(input).each do |key, value|
    list = {}
    value.each do
      list[:db] = value.dig('database')
      list[:user] = value.dig('username') if value.key?('username')
      list[:password] = value.dig('password') if value.key?('password')
      list[:magic_number] = (value.dig('pool') || 1) * (value.dig('timeout') || 1000)
    end
    result << Hash[key.to_sym, list]
  end
  result
end

# ####################################
# TASK3
# ####################################
def task_2_3(array)
  array.flatten.sort.uniq.reverse
end

# ####################################
# TASK4
# ####################################
def task_2_4(string)
  letters = string.downcase.scan(/\w/)
  letters == letters.reverse
end
