# Some comment
class SuperScript < Script
  def self.run(name_command, &block_body)
    @name_command = name_command[:name]
    @file1 = name_command[:stdout_log]
    @file2 = name_command[:stderr_log]
    @files_name = []
    @old_stdout = $stdout.dup
    @string_io = ''
    return 'ERROR! NO BLOCKS!' unless block_given?
    @string_script = StringIO.new
    some_old = $stdout
    $stdout = @string_script
    super()
    $stdout = some_old
    SuperScript.fil(block_body)
    $stdout = STDOUT
  end

  def self.fil(block_body)
    if !@file1 && !@file2
      begin
        show_normal(block_body)
      rescue StandardError => e
        $stdout = @old_stdout
        show_message(e)
      end
    else
      with(block_body)
    end
  end

  def self.with(block_body)
    filepath = @file1
    printf @string_script.string
    $stdout = File.open(filepath, 'w') if @file1
    begin
      show_normal(block_body)
    rescue StandardError => e
      resc_meth(e)
    end
  end

  def self.show_normal(block_body)
    string_io = StringIO.new
    some_old = $stdout
    $stdout = string_io
    res = block_body.call
    $stdout = some_old
    if !@file1
      if res
        first_part = @string_script.string + string_io.string + Time.now.to_s
        second_part = ' ' + @name_command.to_s + ' ' + res.to_s + "\n"
        show_string = first_part + second_part
      else
        show_string = @string_script.string + string_io.string + Time.now.to_s + ' ' + @name_command.to_s + ' ' + "\n"
      end
      printf show_string
    else
      show_string = string_io.string + Time.now.to_s + ' ' + @name_command.to_s + ' ' + res.to_s + "\n"
      p show_string
    end
  end

  def self.resc_meth(exc)
    std_before
    show_message(exc)
    std_cont
  end

  def self.show_message(exc)
    target_string = SuperScript.form_need_string(exc.message.to_s)
    if @file2
      printf target_string
      p ''
    end
    printf @string_script.string + target_string unless @file2
  end

  def self.std_before
    $stdout = if @file2
                filepath = @file2
                File.open(filepath, 'w')
              else
                @old_stdout.dup
              end
  end

  def self.std_cont
    filepath = @file1
    $stdout = File.open(filepath, 'w') if @file1
  end

  def self.form_need_string(message)
    'ERROR: ' + Time.now.to_s + ' ' + @name_command + ' ' + message + "\n"
  end
end
