def task_3_1(input)
  start_time = Time.now
  input.call
  end_time = Time.now
  (end_time - start_time).round(1)
end

def task_3_2(massive, default_param = 0)
  summa = 0
  if block_given?
    massive.each do |el|
      summa += yield(el)
    end
  else
    massive.each do |el|
      summa += el
    end
  end
  summa + default_param
end

def task_3_3(range)
  result = 0
  range.to_a.each do |el|
    if el % 7 == 3 && el < 999 && el > 99
      result = el
      break
    end
  end
  result
end

def task_3_4(_first, _second, *others)
  return 'ERROR' unless block_given?
  others.each do |el|
    yield(el)
  end
end

def task_3_5(massive)
  result_massive = []
  return [] unless block_given?
  massive.each do |el|
    next unless yield(el)
    result_massive << el if (el % 2).eql? 0
  end
  result_massive
end

def task_3_6(some_input)
  bool_massive = []
  return some_input unless block_given?
  substrings = some_input.split(/\n/)
  substrings.each do |el|
    bool_massive << yield(el)
  end
  bool_massive
end
