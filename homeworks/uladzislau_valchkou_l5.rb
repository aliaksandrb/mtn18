#!/usr/bin/env ruby
# top level comment
class SuperScript < Script
  def self.run(name, _stdout_log = nil, _stderr_log = nil)
    super()
    result = yield
  rescue StandardError => err
    err_log = "ERROR: #{Time.now} #{name[:name]} #{err}"
    name[:stderr_log].nil? ? (puts err_log) : (File.open(name[:stderr_log], 'w') { |f| f.puts err_log })
  else
    out_log = "#{Time.now} #{name[:name]} #{result}"
    name[:stdout_log].nil? ? (puts out_log) : (File.open(name[:stdout_log], 'w') { |f| f.puts out_log })
  end
end
