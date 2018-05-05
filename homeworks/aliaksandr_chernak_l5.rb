# comment
#
class SuperScript < Script
  def self.write(fname, info)
    if !fname.nil?
      file = File.open(fname, 'a')
      file.puts(info)
      file.close
    else
      puts info
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
