# class SuperScript
class SuperScript < Script
  def self.out(name, result)
    "#{Time.now} #{name[:name]} #{result}"
  end
  
  def self.out_error(name, ex)
    "ERROR: #{Time.now} #{name[:name]} #{ex}"
  end
      
  def self.run(name = nil, _stdout_log = nil, _stderr_log = nil)
    super()
    result = yield
  rescue StandardError => ex
    if name[:stderr_log].nil?
      puts out_error(name, ex)
    else
      File.open(name[:stderr_log], 'w') { |file| file.puts out_error(name, ex) }
    end
  else
    if name[:stdout_log].nil?
      puts out(name, result)
    else
      File.open(name[:stderr_log], 'w') { |file| file.puts out(name, result) }
    end
  end
end
