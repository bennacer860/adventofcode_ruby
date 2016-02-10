require 'pry'

def perform(grid,action,from_x,from_y,to_x,to_y)
  # puts "#{action} "
  (from_y..to_y).to_a.each do |x|
    (from_x..to_x).to_a.each do |y|
      begin
        case action.strip
        when "turn on"
          grid[x][y] += 1
        when "turn off"
          grid[x][y] -= 1
          grid[x][y] = 0 if grid[x][y] < 0
        when "toggle"
          grid[x][y] += 2
        end
      rescue
        puts " exception #{x},#{y}"
      end
    end
  end
end

def print_grid(grid)
  grid.each_with_index do |row,row_index|
    row.each_with_index do |column,column_index|
      print "#{grid[row_index][column_index]} "
    end
    puts
  end
end


def count_lights(grid)
  count = 0
  grid.each_with_index do |row,row_index|
    row.each_with_index do |column,column_index|
      # puts el
      # puts '-'
      count += grid[row_index][column_index] 
    end
  end
  count
end


x = 1000
# x = 10
y = 1000
# y = 10
@grid = Array.new(y) { Array.new(x,0)  }
File.readlines("input.txt").each do |line|
  line = line.gsub(/(through)/,"")
  action = /(^.*?)\d/.match(line)
  action = action[0].chop
  line = line.gsub(action,"")
  coordinates = line
  from = coordinates.split(" ")[0]
  to   = coordinates.split(" ")[1]

  from_x = from.split(",")[0].to_i
  from_y = from.split(",")[1].to_i

  to_x = to.split(",")[0].to_i
  to_y = to.split(",")[1].to_i
  
  perform(@grid,action,from_x,from_y,to_x,to_y)
end

# p @grid
# puts count_lights @grid
# print_grid @grid
# turn_on @grid,0,0,999,0


puts '*' * 20
#
# perform(@grid,"turn on",1,1,5,5)
# perform(@grid,"turn off",1,1,4,4)
# perform(@grid,"toggle",1,1,2,2)
# print_grid @grid
puts count_lights @grid
