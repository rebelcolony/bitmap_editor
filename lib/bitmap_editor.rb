class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when /^[I]\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])$/
          create_new(line)
      when /[C]/
          clear_grid
      when /[L]\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s[A-Z]/
          draw_single(line)
      when /[V]\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s[A-Z]/
          draw_vertical(line)
      when /[H]\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0])\s[A-Z]/
          draw_horizontal(line)
      when /[S]/
          draw
      else
          puts 'unrecognised command, numeric values must be between 1-250'
      end
    end
  end

  def create_new(line)
    n = line.delete('I').split(" ")
    column = n[0].to_i
    row = n[1].to_i
    @column = column
    @row = row
    create_blank_grid
  end

  def draw_single(line)
    n = line.delete('L').split(" ")
    column_coordinate = n[0].to_i
    row_coordinate = n[1].to_i
    color = n[2]
    @grid[row_coordinate - 1][column_coordinate - 1] = color
  end

  def draw
    @grid.each_with_index { |x, i| puts @grid[i].join("") } #draws the grid
  end

  def create_blank_grid
    @grid = Array.new(@row) {Array.new(@column, "O")} # creates the grid
  end

  def clear_grid
    create_blank_grid
  end

  def draw_vertical(line)
    n = line.delete('V').split(" ")
    column_coordinate = n[0].to_i
    row_coordinate1 = n[1].to_i
    row_coordinate2 = n[2].to_i
    color = n[3]
    range = row_coordinate1 - 1..row_coordinate2 - 1
    for i in range.step(1) do
      @grid[i][column_coordinate - 1] = color
    end
  end

  def draw_horizontal(line)
    n = line.delete('H').split(" ")
    column_coordinate1 = n[0].to_i
    column_coordinate2 = n[1].to_i
    row_coordinate = n[2].to_i
    color = n[3]
    grid = Array.new(@row) {Array.new(@column, "O")}
    range = column_coordinate1 - 1..column_coordinate2 - 1
    for i in range.step(1) do
      @grid[row_coordinate - 1][i] = color
    end
  end

end
