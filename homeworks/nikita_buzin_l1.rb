#####################################
#TASK1
#####################################
def task_1(input)
  task1_list = ''
  input.each_line do |lines|
    task1_list << lines[0..-2] if (lines.downcase['error'])
  end
  task1_list
end

#####################################
#TASK2
#####################################
def task_2(input)
  task2_list = []
  input.each_line do |lines|
    if (lines.match(/(?:\d{1,3}\.){3}\d{1,3} - - \[(.*?)\] "POST \/.* HTTP\/.*/))
      task2_list << lines.split('[')[1].split(']')[0] + " FROM: " + lines.split[0] + " TO:" + lines.upcase.split('POST')[1].split('HTTP')[0][0..-2] if (lines.downcase.match("^(?!.*error).*$"))
    end
  end
  task2_list
end

#####################################
#TASK3
#####################################
def task_3(input)
  require 'date'
  date_list = []
  input.each_line do |lines|
    date_list.push DateTime.parse(lines).to_time.to_f if (lines.downcase['calling core with action:'])
  end
  (date_list[1] - date_list[0]).round(2)
end

#####################################
#TASK4
#####################################
def task_4(input)
  sum = 0
  input.each_char do |numbers|
    if numbers.match(/\d+/)
      sum += numbers.to_i
    end
  end
  sum
end
