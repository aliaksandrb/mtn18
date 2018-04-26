#######################################################
# Task_2.1 Fibonacci_numbers
def fib(n)
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
