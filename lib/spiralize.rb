require 'matrix'
require 'byebug'

module Spiralize
  Matrix.include Spiralize
  def spiralize
    @matrix = self
    build_matrix_from_array(@matrix) if @matrix.is_a?(Array)
    return "Not a matrix" unless @matrix.is_a?(Matrix)

    @num_rows = @matrix.row_size-1
    @num_columns = @matrix.column_size-1

    @result = ""
    positions_visited = []
    current_position = [0,0]

    move_right(positions_visited, current_position)
  end

  private

  def build_matrix_from_array(matrix)
    @matrix = Matrix.rows(matrix)
  end

  def move_right(positions_visited, current_position)
    while current_position[1] != @num_columns &&
      !positions_visited.include?(@matrix[current_position[0],(current_position[1]+1)]) do
      mark_visited(positions_visited, current_position)
      build_result(current_position)
      current_position[1] += 1
    end

    if at_end?(positions_visited)
      build_result(current_position)
      return @result.downcase
    end

    move_down(positions_visited, current_position)
  end

  def move_down(positions_visited, current_position)
    while current_position[0] != @num_rows &&
      !positions_visited.include?(@matrix[(current_position[0]+1),current_position[1]]) do
      mark_visited(positions_visited, current_position)
      build_result(current_position)
      current_position[0] += 1
    end

    move_left(positions_visited, current_position)
  end

  def move_left(positions_visited, current_position)
    while current_position[1] != 0 &&
      !positions_visited.include?(@matrix[current_position[0],(current_position[1]-1)]) do
      mark_visited(positions_visited, current_position)
      build_result(current_position)
      current_position[1] -= 1
    end

    move_up(positions_visited, current_position)
  end

  def move_up(positions_visited, current_position)
    while current_position[0] != 0 &&
      !positions_visited.include?(@matrix[(current_position[0]-1),current_position[1]]) do
      mark_visited(positions_visited, current_position)
      build_result(current_position)
      current_position[0] -= 1
    end
    move_right(positions_visited, current_position)
  end

  def mark_visited(positions_visited, current_position)
    positions_visited << @matrix[current_position[0],current_position[1]]
  end

  def build_result(current_position)
    @result << "#{ @matrix[current_position[0],current_position[1]] } "
  end

  def at_end?(positions_visited)
    (@matrix.to_a.flatten - positions_visited).size == 1
  end
end
