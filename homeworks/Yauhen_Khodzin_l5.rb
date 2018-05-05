#!/usr/bin/env ruby

# SuperScript
class SuperScript < Script
  def self.run(name = nil, _stdout_log = nil, _stderr_log = nil)
    super()
    result = yield
  rescue StandardError => err
    str = "ERROR: #{Time.now} #{name[:name]} #{err}"
    if name[:stderr_log].nil?
      puts str
    else
      File.open(name[:stderr_log], 'w') { |file| file.puts str }
    end
  else
    str = "#{Time.now} #{name[:name]} #{result}"
    if name[:stdout_log].nil?
      puts str
    else
      File.open(name[:stdout_log], 'w') { |file| file.puts str }
    end
  end
end
