# class SuperScript
class SuperScript < Script
  def self.write(path, line)
    if path.nil?
      puts line
    else
      File.open(path, 'w') { |file| file.puts line }
    end
  end
  
  def self.run(**args)
    super()
    block_given? ? result = yield : ''
  rescue StandardError => ex
    str = "ERROR: #{Time.now} #{args[:name]} #{ex}"
    SuperScript.write(args[:stderr_log], str)
  else
    str = "#{Time.now} #{args[:name]} #{result}"
    SuperScript.write(args[:stdout_log], str)
  end
end
