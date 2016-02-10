input = File.open("input.txt",'r')
# input = "^>v<"

def move position,direction
  coordinates = position.split(',')
  x = coordinates[0].to_i
  y = coordinates[1].to_i
  case direction
  when '<'
    x -= 1
  when '>'
    x += 1
  when '^'
    y += 1
  when 'v'
    y -= 1
  end

  "#{x},#{y}"
end

current_coodinate = "0,0"
all_coordinates = Array.new
all_coordinates << current_coodinate

input.each_char do |c|
  current_coodinate = move current_coodinate,c
  all_coordinates <<  current_coodinate
  # puts current_coodinate
end

p all_coordinates.uniq.count
