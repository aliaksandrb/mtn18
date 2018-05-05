# class SuperScript
class SuperScript < Script
  def self.out(name, result)
    "#{Time.now} #{name[:name]} #{result}"
  end
  
  def self.out_error(name, ex)
    "ERROR: #{Time.now} #{name[:name]} #{ex}"
  end
  
  def self.write_file(name, _result = nil, _ex = nil)
    args.each do |path|
      output_file = File.open(path, 'w')
      output_file.puts out(name, result.to_s, ex.to_s)
    end
  end
    
  def self.run(name = nil, _stdout_log = nil, _stderr_log = nil)
    super()
    result = yield
  rescue StandardError => ex
    if name[:stderr_log].nil?
      puts out_error(name, ex)
    else
      write_file(name, name[:stderr_log], ex)
    end
  else
    if name[:stdout_log].nil?
      puts out(name, result)
    else
      write_file(name, name[:stdout_log], result)
    end
  end
end
