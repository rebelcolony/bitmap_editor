class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when "S"
          puts "There is no image"
      when /[I]\s\d{1,3}\s\d{1,3}/
          create_new(line)
      else
          puts 'unrecognised command :('
      end
    end
  end

  def create_new(line)
    # valdate 1-250
    n = line.delete('I').split(" ")
    row = n[0].to_i
    column = n[1].to_i
    unless row > 0 && row < 251
      puts "sorry values must be between 1-250"
    else
      # create rows (x)
    end
    unless column > 0 && column < 251
      puts "sorry values must be between 1-250"
    else
      # create columns (y)
    end
  end

end
