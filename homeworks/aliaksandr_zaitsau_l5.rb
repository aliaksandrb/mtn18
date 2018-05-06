# SuperScript
class SuperScript < Script
  def self.run(name, _stdout_log = nil, _stderr_log = nil)
    super()
    block_given? ? result = yield : ''
  rescue StandardError => err
    str = "ERROR: #{Time.now} #{name[:name]} #{err}"
    file = name[:stderr_log]
  else
    str = "#{Time.now} #{name[:name]} #{result}"
    file = name[:stdout_log]
  ensure
    if file.nil?
      puts str
    else
      File.open(file, 'w') { |f| f.puts str }
    end
  end
end
