#######################################################
# Task_2.1 Fibonacci_numbers
def task_2_1(n)
  return [n] if (0..1).cover? n
  res = []
  x = 1
  z = 1
  n.times do
    res << z
    x, z = z, x + z
  end
  res
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
