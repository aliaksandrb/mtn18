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
  res = [nil]
  input.each_line do |line|
    unless line.downcase.include? 'error'
      pars = line.match %r/(\b(\d{1,3}\.){3}\d{1,3}).*(\[.*\]).*( \/.[^\s]*)/
      res << "#{pars[3][1...-1]} FROM: #{pars[1]} TO:#{pars[4].to_s.upcase}"
    end
  end
  res
end
