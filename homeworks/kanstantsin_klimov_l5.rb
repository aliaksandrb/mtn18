# SuperScript class. Performs magic
class SuperScript < Script
  def self.write(file_name, line)
    if !file_name.nil?
      file = File.open(file_name, 'a')
      file.puts(line)
      file.close
    else
      puts line
    end
  end

  def self.run(**args)
    super()
    block_given? ? result = yield : ''
  rescue StandardError => e
    SuperScript.write(args[:stderr_log], "ERROR: #{Time.now} #{args[:name]} #{e}")
  else
    SuperScript.write(args[:stdout_log], "#{Time.now} #{args[:name]} #{result}")
  end
end
