#!/usr/bin/env ruby .

#Task 1

def task_1(input)
  empty = ''
  input.each_line do |line|
    if line.downcase.include? 'error'
      empty << line[0...-1]
    end
  end
  empty
end

#Task 2

def task_2(input)
  array = []

  input.each_line do |line|
    if (line.match(/(?:\d{1,3}\.){3}\d{1,3} - - \[(.*?)\] "POST \/.* HTTP\/.*/))
      custom_datetime = line.split('[')[1].split(']')[0]
      ip_address = line.split[0]
      endpoint_path = line.upcase.split('POST')[1].split('HTTP')[0][0..-2]
      array <<  custom_datetime+" FROM: "+ip_address+" TO:"+endpoint_path if (line.downcase.match("^(?!.*error).*$"))
    end
  end
  array
end

#Task 3

def task_3(input)
  make = 0
  input.each_line do |line|
    require 'time'
    if line.downcase.include? 'calling core with action:'
      datetime = Time.parse((line.match /.+?(?=\s\D)/).to_s)
      make = datetime - make
    end
  end
  make
end

#Task 4
def task_4(input)
  counted = 0
  input.each_char { |laude| counted += laude.to_i }
  counted
end
