class GameOfLife
  def initialize(grid)
    @grid = grid
    @rows = grid.length
    @cols = grid[0].length
  end

  def current_generation
    @grid
  end

  def make_next_generation
    new_grid = Array.new(@rows) { Array.new(@cols, 'X') }

    @rows.times do |i|
      @cols.times do |j|
        live_neighbors = count_live_neighbors(i, j)
        cell = @grid[i][j]

        new_grid[i][j] = (cell == 'O' && (live_neighbors == 2 || live_neighbors == 3)) || (cell == 'X' && live_neighbors == 3) ? 'O' : 'X'
      end
    end

    @grid = new_grid
  end

  def count_live_neighbors(row, col)
    # the positions for every neighbor
    neighbors = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]

    count = 0

    neighbors.each do |dx, dy|
      x = row + dx
      y = col + dy

      count += 1 if x.between?(0, @rows - 1) && y.between?(0, @cols - 1) && @grid[x][y] == 'O'
    end

    count
  end
end

# initial_generation = [
#   ['O', 'X', 'X'],
#   ['X', 'O', 'O'],
#   ['O', 'O', 'X']
# ]

# game = GameOfLife.new(initial_generation)
# game.make_next_generation
# print the result
# game.current_generation.each { |row| puts row.join(' ') }
