#!/usr/bin/env ruby

# class Script
#   puts 'something from script'
# end

# SuperScript class description
class SuperScript < Script
  def self.run(name, _stdout_log = nil, _stderr_log = nil)
    super()
    out = yield(name)
  rescue StandardError => error
    err_log = "ERROR: #{Time.now} #{name[:name]} #{error}"
    name[:stderr_log].nil? ? (puts err_log) : (File.open(name[:stderr_log], 'w') { |file| file.puts err_log })
  else
    st_output = "#{Time.now} #{name[:name]} #{out}"
    name[:stdout_log].nil? ? (puts st_output) : (File.open(name[:stdout_log], 'w') { |file| file.puts st_output })
  end
end
