# SuperScript class
class SuperScript < Script
  def self.run(name, _stdout_log = nil, _stderr_log = nil)
    super()
    block_given? ? result = yield : ''
  rescue StandardError => error
    error_message = "ERROR: #{Time.now} #{name[:name]} #{error}"
    file = name[:stderr_log]
    if name[:stderr_log].nil?
     puts(error_message)
    elsif
      File.open(name[:stderr_log], 'w') { |f| f.puts(error_message)}
    end
  else
    message = "#{Time.now} #{name[:name]} #{result}"
    file = name[:stdout_log]
    if name[:stdout_log].nil?
       puts(message)
    elsif
      File.open(name[:stdout_log], 'w') { |f| f.puts(message) }
    end
  end
end
