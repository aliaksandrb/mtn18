#=> FIRST TASK!!!
def task_1(input)
  #=> finding = /error/.match(str)
  substrings = input.split(/\n/)
  #=> print str.scan("error")

  i = 0
  #=> the cycle
  target_target_string = ''
  loop do
    substring = substrings[i].scan('error')
    if substrings[i].include?('error')
      target_target_string = substrings[i]
    end
    i += 1
    break if i == substrings.size - 1
  end
  p target_target_string
end

def task_2(input)
  #=> finding = /error/.match(str)
  substrings = input.split(/\n/)
  #=> print str.scan("error")

  i = 0
  #=> the cycle
  target_target_string = []
  loop do
    substring = substrings[i].scan('error')
    unless substrings[i].include?('error')
      target_string = ''
      date = substrings[i][/[0-9]{2}\/[a-zA-Z]+\/[0-9]{4}:\d{2}:\d{2}:\d{2} \+\d{4}/]
      #=> date += "\n"
      date.upcase
      target_string += date
      target_string += ' FROM: '
      ip_address = substrings[i][/\d{1,}\.\d{1,}\.\d{1,}\.\d{1,}/]
      ip_address.upcase
      target_string += ip_address
      to = substrings[i][/(?<=POST )\/.+\/.+\/[a-z]+/]
      if to != nil
        to = to.upcase
        target_string += ' TO: '
        target_string += to
        target_target_string << target_string
      end
    end
    i += 1
    break if i == substrings.size
  end
  target_target_string
end

def task_3(input)
  #=> SECOND TASK!!!  

  substrings = input.split(/\n/)
  i = 0

  need_massive = []
  count_massive = 0
  #=> the cycle
  loop do
    #=> substring = substrings[i].scan("Calling")
    if substrings[i].include?('Calling')
      #=> substrings[i] += "\n"
      #=> printf substrings[i]
      need_time = substrings[i][/(?<=17:)\d{2}:\d{2}\.\d/]
      need_time += "\n"
      need_massive[count_massive] = need_time
      count_massive += 1
    end
    i += 1
    break if i == substrings.size
  end

  first_minute = need_massive[0][/\d{2}/].to_i * 60
  second_minute = need_massive[1][/\d{2}/].to_i * 60
  result_minute = second_minute - first_minute

  #=> print result_minute

  first_sec = need_massive[0][/\d{2}\.\d/].to_f
  second_sec = need_massive[1][/\d{2}\.\d/].to_f
  result_second = second_sec - first_sec

  #=> print result_second
  the_result = result_minute + result_second
  the_result = the_result.round(1)
  p the_result
end

def task_4(input)
  #=> THIRD_TASK!!!

  substring = input.scan(/\d/)
  summa_cifr = 0
  i = 0
  loop do
    summa_cifr += substring[i].to_i
    break if i == substring.size
    i += 1
  end
  summa_cifr
end
