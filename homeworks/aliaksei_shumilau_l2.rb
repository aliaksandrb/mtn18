#######################################################
# Task_2.1 Fibonacci_numbers
def task_2_1(n)
  if n == 1
    puts 0
  else
    task_2_1 = [0, 1]
    (n - 2).times do
      task_2_1 << task_2_1[-1] + task_2_1[-2]
    end
    puts task_2_1.join(' ')
  end
end

######################################################
# Task_2.2 Yaml_parcing




######################################################
# Task_2.3 Returning an array







######################################################
# Task_2.4 The row palindrome
def task_2_4(string)
  return true if string == string.reverse
  false
end
