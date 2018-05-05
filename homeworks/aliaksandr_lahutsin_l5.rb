# class SuperScript
class SuperScript < Script
  def self.write(path, line)
    if path.nil?
      puts line
    else
      File.open(path, 'w') { |file| file.puts line }
    end
  end
  
  def self.out(**args)
    if args[:ex].nil?
      "#{Time.now} #{args[:name]} #{args[:result]}"
    else
      "ERROR: #{Time.now} #{args[:name]} #{args[:ex]}"
    end
  end

  def self.run(**args)
    super()
    block_given? ? result = yield : ''
  rescue StandardError => ex
    write(args[:stderr_log], out(args[:name], ex)
  else
    write(args[:stdout_log], out(args[:name], result)
  end
end
