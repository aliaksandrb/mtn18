# class SuperScript
class SuperScript < Script
  def self.run(name, _stdout_log = nil, _stderr_log = nil)
    super()
    result = yield
  rescue StandardError => err
    inf = "ERROR: #{Time.now} #{name[:name]} #{err}"
    log = name[:stderr_log]
  else
    inf = "#{Time.now} #{name[:name]} #{result}"
    log = name[:stdout_log]
  ensure
    if log.nil?
      puts inf
    else
      File.open(log, 'w') { |f| f.puts inf }
    end
  end
end
