def task_2_1(number)
  fib = []
  return fib unless check(number)
  return fib.push(0) if number == 0
  return fib.push(1) if number == 1
  fib[0] = 1
  fib[1] = 1
  i = 1
  (number - 2).times do
    fib[i + 1] = fib[i] + fib[i - 1]
    i += 1
  end
  fib
end

def check(number)
  return false if number.class.to_s != 'Integer'
  return false if number < 0
  true
end

def task_2_2(input)
  require 'yaml' # STEP ONE, REQUIRE YAML!
  some_thing = YAML.safe_load(input) #=> "foo"
  mass = some_thing.to_a
  printf "\n\n"
  super_massive = []
  super_massive = get_dict(mass, super_massive)
  #=> super_massive.push(main_dict)
  p super_massive
end

def get_dict(some_thing, super_massive)
  env = ''
  str = some_thing
  str.each do |el|
    el.each do |sub|
      local_dict = {}
      if sub.class.to_s == 'Hash'
        first_dict = {}
        sub.each do |dict|
          first_dict = hart(dict, first_dict)
        end
        first_dict = magic(first_dict, sub)
        local_dict[env.to_sym] = first_dict
        super_massive.push(local_dict)
      else
        env = sub
      end
    end
  end
  super_massive
end

def magic(first_dict, sub)
  if sub.include?('pool') && sub.include?('timeout')
    first = sub['pool']
    second = sub['timeout']
    first_dict[:magic_number] = first * second
  elsif sub.include?('pool')
    first = sub['pool'] * 1000
    first_dict[:magic_number] = first
  elsif sub.include?('timeout')
    first_dict[:magic_number] = sub['timeout'] * 1
  else
    first_dict[:magic_number] = 1000
  end
  first_dict
end

def hart(dict, first_dict)
  if dict.include?('database')
    first_dict[:db] = dict[1]
  elsif dict.include?('username')
    first_dict[:user] = dict[1]
  elsif dict.include?('password')
    first_dict[:password] = dict[1]
  end
  first_dict
end

def task_2_3(input)
  input.flatten.sort.reverse.uniq
end

def task_2_4(input)
  bool = true
  bool = false unless input.downcase.reverse == input.downcase
  bool
end
