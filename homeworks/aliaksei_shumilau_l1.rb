#TASK1
def task1(input)
  task1 = []
  input.each_line do |line|
    if (line.downcase['error'])
      task1 << line[]
  end
  task1[]
end

#TASK2
def task2(input)
  task2 = []
  input.each_line do |line|
    task2 << line.split('[')[1].split(']')[0] + " FROM:" + line.split[0] + " TO:" + line.upcase.split('POST')[1].split('HTTP')[0] if (line.downcase.match("^(?!.*error).*$"))
  end
  task2
end
