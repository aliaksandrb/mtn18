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
    if (line.match(/(?:\d{1,3}\.){3}\d{1,3} - - \[(.*?)\] "POST .+" \d+ .+ \d.\d+/))
      unless (line.downcase.include? "error")
        result << line[/\[(.*?)\]/][1...-1] + " FROM: " + line[/(?:\d{1,3}\.){3}\d{1,3}/] + " TO: " + line.split(/\s/)[6].upcase
      end
    end
  end
  result
end

task_1(text)
task_2(text)
