#######################################################
# Task_2.1 Fibonacci_numbers
def task_2_1(n)
  if n == 1
    puts 0
  else
    fib = [0, 1]
    (n - 2).times do
      fib << fib[-1] + fib[-2]
    end
    puts fib.join(' ')
  end
end

######################################################
# Task_2.3 Returning an array
def task_2_3(array)
  array.flatten.uniq.sort.reverse
end

######################################################
# Task_2.4 The row palindrome
def task2_4(string)
  string == string.reverse.downcase.scan(/\w/)
end
