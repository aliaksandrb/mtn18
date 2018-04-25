#!/usr/bin/env ruby

=begin
на вход (читать "в переменной") подаётся текст вида:

```bash
10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
```

Вывести на экран:
- полный текст строки с ошибкой (наличие подстроки "error" в любом регистре)
- для каждой строки (без ошибки) вывести соответствующую ей комбинацию вида: "datetime from: ip_address to: endpoint_path(в большом регистре)"
  например, для примера выше первым выводом будет: "23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /GRID/2/MESSAGES"
=end

text = %Q(10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290)

def task_1(input)
  result = ''
  input.each_line do |line|
      if (line.downcase.include? "error")
        result << line[0..-2]
      end
    end
  result
end

def task_2(input)
  result = []
  input.each_line do |line|
    if (line.match(/(?:\d{1,3}\.){3}\d{1,3} - - \[(.*?)\] "POST \/.* HTTP\/.*/))
      unless (line.downcase.include? "error")
        result << line[/\[(.*?)\]/][1...-1] + " FROM: " + line[/(?:\d{1,3}\.){3}\d{1,3}/] + " TO: " + line.split(/\s/)[6].upcase
      end
    end
  end
  result
end

task_1(text)
task_2(text)

=begin
Task2
=end
require 'time'
text2 = %Q(
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 18:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event)

def task_3(input)
  time = Time.new('0')
  result = []
  input.each_line do |line|
    if (line.downcase.include? "calling core with action")
      if time == Time.new('0')
        time = Time.parse(line.split(' ')[0..1].to_s)
      else
        result << (time - Time.parse(line.split(' ')[0..1].to_s)).abs
        time = Time.parse(line.split(' ')[0..1].to_s)
      end
    end
  end
  result.first
end
task_3(text2)

=begin
3. Дана произвольная строка, в которой есть буквы, цифры, кони, лоси..
Вывести на экран сумму всех цифр из данной строки. (вещественные числа, типа 3.14 рассматриваются как 3 числа)
=end

string = "asdasd3.14 asd 12345 7652"
def task_4(input)
  summ = 0
  input.each_char do |chr|
    if chr.to_i > 0 && chr.to_i <= 9
      summ += chr.to_i
    end
  end
  summ
end
task_4(string)
