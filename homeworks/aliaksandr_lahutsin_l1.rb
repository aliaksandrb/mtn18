#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

class ParserLogs
    attr_accessor :text 

    def initialize (text) 
        @text = text
    end

    def output_state_error
        out = ""
        #first = ""
        for i in text.split("\n")
            if i.include?('error') || i.include?('Error')
                #first << "#{i}"                 
                out << "#{i}"
            else
                #array = i.split(' ')
                #out << array[3].to_s.delete('[') + " " + array[4].to_s.delete(']') + " " + "FROM: " + array[0].to_s + " TO: " + array[6].to_s.upcase
            end
        end
        #first + 
        out
    end
   
       def output_state
        out = ""
        #first = ""
        for i in text.split("\n")
            if i.include?('error') || i.include?('Error')
                #first << "#{i}"                 
                #out << "#{i}"
            else
                array = i.split(' ')
                out << array[3].to_s.delete('[') + " " + array[4].to_s.delete(']') + " " + "FROM: " + array[0].to_s + " TO: " + array[6].to_s.upcase
            end
        end
        #first + 
        out.to_a
    end
end


#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

class ParserSecondsEvents
    attr_accessor :text

    def initialize (text) 
        @text = text
    end

    def parse_logs
        line_one_day = ""
        counter = 0
        for i in text.split("\n")
            if i.include?('Calling')
                if counter < 2 && i.include?('event') || i.include?('messages')
                array = i.split(' ')
                line_one_day << array[1] + " "
                counter += 1
                end                                                                                         
            end
        end
        output_seconds_state_one_day(line_one_day)
    end

    def parse_logs_more
        line_more = ""
        counter = 0
        for i in text.split("\n")
            if i.include?('Calling')
                if counter < 2 && i.include?('event') || i.include?('messages')
                array = i.split(' ')
                line_more << array[0] + " " +  array[1]  + " "
                counter += 1
                end                                                                                         
            end
        end
        output_seconds_state_more(line_more)
    end

    def output_seconds_state_one_day(text)
        array = text.split(' ')
        one = array[0].to_s
        two = array[1].to_s
        h1, m1, s1 = one.split(":").map(&:to_f)
        h2, m2, s2 = two.split(":").map(&:to_f)
        ((h2 - h1) * 3600 + (m2 - m1) * 60 + (s2 - s1)).round(2).to_s
    end

    require 'time'

    DT_FMT = '%Y-%m-%d %H:%M:%S'
    SECONDS_PER_DAY = 24*60*60

    def output_seconds_state_more(text)
        array = text.split(' ')
        start = DateTime.strptime(array[0] + array[1], DT_FMT).to_time
        finish = DateTime.strptime(array[2] + array[3], DT_FMT).to_time
        "With calculation full time (%Y-%m-%d %H:%M:%S): " + (finish-start).to_s
    end

end

#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

def parse_string(string)
    number = string.split(//).map {|x| x[/\d+/]}.compact.join("")
    array = number.split('')
    array.map(&:to_i).sum
end

#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

# check task1

def task_1(text)
    pl = ParserLogs.new(text)
    pl.output_state_error
end

def task_2(text)
    pl = ParserLogs.new(text)
    pl.output_state
end

# check task2

def task_3(text)
    pse = ParserSecondsEvents.new(text)
    pse.parse_logs
end

# check task3

def task_4(text)
    parse_string(text)
end

=begin

puts task_1('''10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
''')
puts task_2('''10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
''')

puts task_2('''2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
''')

puts task_3("344353445h4.8ty83h2v72yi3g2t35y457%^&*()_k4wuaehzw64jkie57lk7kwaa84t8.2pgib93uh")

=end
