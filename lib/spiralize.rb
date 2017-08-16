require 'matrix'

module Spiralize
  Matrix.include Spiralize
  def spiralize
    @matrix = self
    return "" if @matrix.empty?

    @num_rows = @matrix.row_size-1
    @num_columns = @matrix.column_size-1

    @matrix_map = ((0..@num_rows).map{|i| (0..@num_columns).map{|j| [i, j]}}).flatten(1)

    @result = ""
    @positions_visited = []
    @current_position = [0,0]

    move_right
  end

  private

  def move_right
    while @current_position[1] != @num_columns &&
      !@positions_visited.include?([@current_position[0],(@current_position[1]+1)]) do
      mark_visited
      build_result
      @current_position[1] += 1
    end

    if at_end?
      @result << "#{ @matrix[@current_position[0],@current_position[1]] }"
      return @result.downcase
    end

    move_down
  end

  def move_down
    while @current_position[0] != @num_rows &&
      !@positions_visited.include?([(@current_position[0]+1),@current_position[1]]) do
      mark_visited
      build_result
      @current_position[0] += 1
    end

    move_left
  end

  def move_left
    while @current_position[1] != 0 &&
      !@positions_visited.include?([@current_position[0],(@current_position[1]-1)]) do
      mark_visited
      build_result
      @current_position[1] -= 1
    end

    move_up
  end

  def move_up
    while @current_position[0] != 0 &&
      !@positions_visited.include?([(@current_position[0]-1),@current_position[1]]) do
      mark_visited
      build_result
      @current_position[0] -= 1
    end
    move_right
  end

  def mark_visited
    @positions_visited << Array.new(@current_position)
  end

  def build_result
    @result << "#{ @matrix[@current_position[0],@current_position[1]] } "
  end

  def at_end?
    (@matrix_map - @positions_visited).size == 1
  end
end
