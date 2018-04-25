def task_1(input)
  res = ''
  input.each_line do |line|
    if line.downcase.include? 'error'
      res << line[0...-1]
    end
  end
  res
end

def task_2(input)
  res = []
  input.each_line do |line|
    unless line.downcase.include? 'error'
      pars = line.match %r/(\b(\d{1,3}\.){3}\d{1,3}).*(\[.*\]).*( \/.[^\s]*)/
      res << "#{pars[3][1...-1]} FROM: #{pars[1]} TO:#{pars[4].to_s.upcase}"
      end
    end
  res
end

def task_3(input)
  res = 0
  input.each_line do |line|
    require 'time'
    if line.downcase.include? 'calling core with action:'
      datetime = Time.parse((line.match /.+?(?=\s\D)/).to_s)
      res = datetime - res
    end
  end
  res
end

def task_4(input)
  res = 0
  input.each_char { |sum| res += sum.to_i }
  res
end
