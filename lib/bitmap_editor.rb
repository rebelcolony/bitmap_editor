
# TODO validate in regex
#

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
          clear_grid
      when /[L]\s\d{1,3}\s\d{1,3}\s[A-Z]/
          draw_single(line)
      when /[V]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[A-Z]/
          draw_vertical(line)
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
      create_blank_grid
    end
  end

  def create_blank_grid
    grid = Array.new(@row) {Array.new(@column, "O")}
    grid.each_with_index { |x, i| puts grid[i].join("") }
  end

  def clear_grid
    create_blnak_grid
  end

  def draw_single(line)
    n = line.delete('L').split(" ")
    row_coordinate = n[0].to_i
    column_coordinate = n[1].to_i
    color = n[2]
    if row_coordinate < 1 || row_coordinate > 250
      puts "sorry values must be between 1-250"
    elsif column_coordinate < 1 || column_coordinate > 250
      puts "sorry values must be between 1-250"
    else
      grid = Array.new(@row) {Array.new(@column, "O")}
      grid[column_coordinate - 1][row_coordinate - 1] = color
      grid.each_with_index { |x, i| puts grid[i].join("") }
    end
  end

  def draw_vertical(line)

  end

end
