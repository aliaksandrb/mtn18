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
  rescue StandardError => e
    SuperScript.write(args[:stderr_log], "ERROR: #{Time.now} #{args[:name]} #{e}")
  else
    SuperScript.write(args[:stdout_log], "#{Time.now} #{args[:name]} #{result}")
  end
end
