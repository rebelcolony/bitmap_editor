
# TODO validate in regex

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when /[I]\s\d{1,3}\s\d{1,3}/
          create_new(line)
      when /[C]/
          clear_grid
      when /[L]\s\d{1,3}\s\d{1,3}\s[A-Z]/
          draw_single(line)
      when /[V]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[A-Z]/
          draw_vertical(line)
      when /[H]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[A-Z]/
          draw_horizontal(line)
      when /[S]/
          draw
      else
          puts 'unrecognised command :('
      end
    end
  end

  def create_new(line)
    # validate 1-250
    n = line.delete('I').split(" ")
    column = n[0].to_i
    row = n[1].to_i
    if row < 1 || row > 250
      puts "sorry values must be between 1-250"
    elsif column < 1 || column > 250
      puts "sorry values must be between 1-250"
    else
      @column = column
      @row = row
      create_blank_grid
    end
  end

  def draw_single(line)
    n = line.delete('L').split(" ")
    column_coordinate = n[0].to_i
    row_coordinate = n[1].to_i
    color = n[2]
    if row_coordinate < 1 || row_coordinate > 250
      puts "sorry values must be between 1-250"
    elsif column_coordinate < 1 || column_coordinate > 250
      puts "sorry values must be between 1-250"
    else
      @grid[row_coordinate - 1][column_coordinate - 1] = color
    end
  end

  def draw
    @grid.each_with_index { |x, i| puts @grid[i].join("") } #draws the grid
  end

  def create_blank_grid
    @grid = Array.new(@row) {Array.new(@column, "O")} # creates the grid
  end

  def clear_grid
    create_blank_grid
    puts ""
  end



  def draw_vertical(line)
    n = line.delete('V').split(" ")
    column_coordinate = n[0].to_i
    row_coordinate1 = n[1].to_i
    row_coordinate2 = n[2].to_i
    color = n[3]
    if row_coordinate1 < 1 || row_coordinate1 > 250
      puts "sorry values must be between 1-250"
    elsif column_coordinate < 1 || column_coordinate > 250
      puts "sorry values must be between 1-250"
    elsif row_coordinate2 < 1 || row_coordinate1 > 250
      puts "sorry values must be between 1-250"
    else
      range = row_coordinate1 - 1..row_coordinate2 - 1
      for i in range.step(1) do
        @grid[i][column_coordinate - 1] = color
      end
    end
  end

  def draw_horizontal(line)
    n = line.delete('H').split(" ")
    column_coordinate1 = n[0].to_i
    column_coordinate2 = n[1].to_i
    row_coordinate = n[2].to_i
    color = n[3]
    if column_coordinate1 < 1 || column_coordinate1 > 250
      puts "sorry values must be between 1-250"
    elsif column_coordinate2 < 1 || column_coordinate2 > 250
      puts "sorry values must be between 1-250"
    elsif row_coordinate < 1 || row_coordinate > 250
      puts "sorry values must be between 1-250"
    else
      grid = Array.new(@row) {Array.new(@column, "O")}
      range = column_coordinate1 - 1..column_coordinate2 - 1
      for i in range.step(1) do
        @grid[row_coordinate - 1][i] = color
      end
    end
  end

end
