#!/usr/bin/env ruby
=begin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*
*                               TASK 1
*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=end
def task_2(log)
  result = []
  unless log.nil? || log == 0
    errors = log.scan(/(?i).*error.*/) #If finds error or ERROR returns whole string
    if !errors[0].nil?
      log.sub!(errors[0] + "\n", '') # Removes errors from log
    end
    begin
        log.each_line do |line|
          datetime = line.match(/\[(.*?)\]/)[1] # Returns dates
          ip_addres = line.match(/^\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/) # Retruns IPs
          endpoint_path = line.match(/"POST \/.*"/)[0].split[1].upcase
          result << "#{datetime} FROM: #{ip_addres} TO: #{endpoint_path}"
        end
    result
  rescue NoMethodError # No the best way, but works.
    ''
    end
  end
end
def task_1(string)
  result = string.scan(/(?i).*error.*/) #If finds error or ERROR returns whole string
  !result.empty? ? result.first : ''
end
=begin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*
*                               TASK 2
*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=end

require 'time'

def task_3(log)
  time = []
  delta = []
  log.scan(/(?i).*Calling core with action.*/).each do |action|
    time << action.split[0..1].join(' ') #If finds error or ERROR returns whole string
  end
  while true
    time1 = Time.parse(time.shift)
    time2 = Time.parse(time.first)
    delta << time2 - time1
    break if time.size == 1
  end
  delta.first
end

=begin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*
*                               TASK 3
*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=end

def task_4(string)
  sum = 0
  string.each_char do |chr|
    !chr.to_i.nil? ? sum += chr.to_i : nil
  end
  sum
end
