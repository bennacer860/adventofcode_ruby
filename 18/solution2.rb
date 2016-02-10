require 'pp'
require 'pry-byebug'
class Grid
  attr_accessor :grid

  def initialize 
    @grid = Array.new
    read_input 'input.txt'
    0.upto(99) do 
      tick
    end
    # pp @grid
    p count_lights
  end

  def read_input filename
    input = File.readlines filename
    input = input.map{|line| line.chomp.strip}
    input.each do |line|
      @grid << line.chars
    end
    add_broken_lights
  end

  def broken_light? x,y
    size = @grid.size - 1
    ["0,0","0,#{size}","#{size},0","#{size},#{size}"].include?("#{x},#{y}")
  end

  def add_broken_lights
    @grid[0][0] ='#'
    @grid[0][-1] ='#'
    @grid[-1][0] ='#'
    @grid[-1][-1] ='#'
  end

  def neighbors_number x,y
    # '#' mean on
    # '.' mean off
    neighbors = Array.new
    neighbors << ((x-1 >= 0 and y-1 >= 0) ? @grid.dig(x-1,y-1) : nil)
    neighbors << ((x >= 0 and y-1 >= 0) ? @grid.dig(x,y-1)  : nil)
    neighbors << ((x+1 >= 0 and y-1 >= 0) ? @grid.dig(x+1,y-1) : nil)
    neighbors << ((x+1 >= 0 and y >= 0) ? @grid.dig(x+1,y) : nil)
    neighbors << ((x+1 >= 0 and y+1 >= 0) ? @grid.dig(x+1,y+1) : nil)
    neighbors << ((x >= 0 and y+1 >= 0) ? @grid.dig(x,y+1) : nil)
    neighbors << ((x-1 >= 0 and y+1 >= 0) ? @grid.dig(x-1,y+1) : nil)
    neighbors << ((x-1 >= 0 and y >= 0) ? @grid.dig(x-1,y) : nil)
    neighbors.select{|value| value == '#'}.count
  end

  def tick
    # binding.pry
    size = @grid.length - 1
    new_grid = Marshal::load(Marshal.dump(@grid))
    0.upto(size) do |x|
      0.upto(size) do |y|
        if neighbors_number(x,y).between?(2,3) and @grid[x][y] == '#'
          new_grid[x][y] = '#'
        elsif neighbors_number(x,y) == 3 and @grid[x][y] == '.'
          new_grid[x][y] = '#'
        else
          new_grid[x][y] = '.'
        end
        new_grid[x][y] = '#'  if broken_light?(x,y)
      end
    end
    @grid = new_grid
  end

  def count_lights
    @grid.flatten.select{|p| p == '#'}.count
  end
end

g = Grid.new
# p g.neighbors_number 5,2
puts
