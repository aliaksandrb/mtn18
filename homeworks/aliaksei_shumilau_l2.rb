#######################################################
# Task_2.1 Fibonacci_numbers
def fibo(n)
  a = 0
  b = 1
  [0..n].each do |i|
    c = a + b
    print "#{c} "
    a = b
    b = c
  end
end
