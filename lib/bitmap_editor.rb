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
      when /[C]/
          clear
      else
          puts 'unrecognised command :('
      end
    end
  end

  def create_new(line)
    # validate 1-250
    n = line.delete('I').split(" ")
    row = n[0].to_i
    column = n[1].to_i
    if row < 1 || row > 250
      puts "sorry values must be between 1-250"
    elsif column < 1 || column > 250
      puts "sorry values must be between 1-250"
    else
      @row = row
      @column = column
      create_grid
    end
  end

  def create_grid
    grid = Array.new(@row) {Array.new(@column, "O")}
    grid.each_with_index { |x, i| puts grid[i].join("") }
  end

  def clear
    create_grid
  end

end
