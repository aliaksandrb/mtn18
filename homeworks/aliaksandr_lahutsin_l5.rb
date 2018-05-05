# class Script
class Script
  attr_accessor :name

  def self.run(name)
    @name = name
  end
end

# class SuperScript
class SuperScript < Script
  def self.out_error(name, result)
    "ERROR: #{Time.now}#{name}#{result}"
  end

  def self.out(name, result)
    "#{Time.now}#{name}#{result}"
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
      array = []
      array << super << out(name, yield.to_s)
    end
    array
  rescue StandardError => ex
    array << out_error(name, ex.to_s)
    array
  end
end
