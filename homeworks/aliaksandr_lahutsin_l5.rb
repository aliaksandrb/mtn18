# class SuperScript
class SuperScript < Script
  def self.out_error(name, result)
    #"ERROR: #{Time.now} #{name} #{result}"
    ''
  end

  def self.out(name, result)
    #"#{Time.now}#{name}#{result}"
    "#{name} #{result}"
  end

  def self.write_file(name, args, result)
    args.each do |path|
      output_file = File.open(path, 'w')
      output_file.puts out(name, result.to_s)
    end
  end

  def self.run(name, *args)
    if !args.empty?
      write_file(name, args, yield)
    else
      puts super
      puts out(name, yield.to_s)
    end
    array
  rescue StandardError => ex
    puts out_error(name, ex.to_s)
  end
end
