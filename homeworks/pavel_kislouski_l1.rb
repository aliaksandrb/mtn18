# first task
def task_1(input)
  result_error = ''
  input.each_line { |log| result_error << log[0..-2] if log.downcase.include? 'error' }
  result_error
end

def task_2(input)
  log_regex = %r{(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}) - - \[([^\]]+?)\] "(GET|POST|PUT|DELETE) ([^\s]+?) (HTTP\/1\.1)"}
  result_parse = []
  input.each_line do |log|
    parser = log.scan(log_regex)[0]
    next if log.scan(log_regex)[0].nil?
    upc = parser[3]
    parse = "#{parser[1]} FROM: #{parser[0]} TO: #{upc.upcase}"
    result_parse << parse
  end
  result_parse
end

# second task
def task_3(input)
  # split output on strings
  strs = input.split(/\n/)
  i = 0
  massive = []
  count_massive = 0

  loop do
    if strs[i].include? 'Calling'
      need_time = strs[i][/(?<=17:)\d{2}:\d{2}\.\d/]
      massive[count_massive] = need_time
      count_massive += 1
    end
    i += 1
    break if i == strs.size
  end

  minute1 = massive[0][/\d{2}/].to_i * 60
  minute2 = massive[1][/\d{2}/].to_i * 60
  minute_res = minute2 - minute1

  sec1 = massive[0][/\d{2}\.\d/].to_f
  sec2 = massive[1][/\d{2}\.\d/].to_f
  second_res = sec2 - sec1

  # result
  (minute_res + second_res).round(1)
end

# third task
def task_4(input)
  summa = 0
  input.each_char { |c| summa += c.to_i }
  summa
end
