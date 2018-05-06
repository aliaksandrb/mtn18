#!/usr/bin/env ruby .

# SuperScript class with conditions
class SuperScript < Script
  def self.run(name, _stdout_log = nil, _stderr_log = nil)
    super()
    znachenie = yield
  rescue StandardError => error
    display = "ERROR: #{Time.now} #{name[:name]} #{error}"
    log = name[:stderr_log]
  else
    display = "#{Time.now} #{name[:name]} #{znachenie}"
    log = name[:stdout_log]
  ensure
    if log.nil?
      puts display
    else
      File.open(log, 'w') { |f| f.puts display }
    end
  end
end
