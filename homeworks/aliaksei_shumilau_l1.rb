#######################################################
#TASK1
def task_1(input)
  list = ''
  input.each_line do |line|
     if (line.downcase.include? 'error')
       list << line[0..-2]
     end
  end
  list
end
######################################################
#TASK2
def task_2(input)
  list = []
  input.each_line do |line|
     list.push(line.split('[')[1].split(']')[0] + ' FROM: ' + line.split[0] + ' TO:' + line.upcase.split('POST')[1].split('HTTP')[0][0..-1]) if (line.downcase.match("^(?!.*error).*$"))
  end
  list
end

######################################################
#TASK3
def task_3(input)
  require 'time'
  list = []
  input.each_line do |line|
    list.push Time.parse(line) if line.include? 'Calling'
  end
    list[1] - list[0]
end

  
#######################################################  
#TASK4
def task_4(input)
  sum = 0
  input.each_char do |letter|
    sum += letter.to_i if letter.to_i.is_a? Integer
  end
  sum
end
