def task_2_1(n)
  if n < 0
    res = []
  elsif n <= 1
    res = [n]
  else
    res = [1, 1]
    n -= 2
    n.times do
      res << res[res.size - 2] + res.last
    end
  end
  res
end

def task_2_2(input)
  require 'yaml'
  res = []
  unless input.empty?
    str = YAML.safe_load input
    str.each do |key, value|
      res << { key.to_sym => {
        db: value.dig('database'),
        user: value.dig('username'),
        password: value.dig('password'),
        magic_number: (value.dig('pool') || 1) * (value.dig('timeout') || 1000)
      }.compact }
    end
  end
  res
end

def task_2_3(array)
  array.flatten.uniq.sort.reverse
end

def task_2_4(string)
  string.casecmp?(string.reverse)
end
