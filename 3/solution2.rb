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

current_coodinate_santa = "0,0"
current_coodinate_robot = "0,0"
all_coordinates = Array.new
all_coordinates << "0,0"

index=0
input.each_char do |c|
  
  if index.even? 
    current_coodinate_santa = move current_coodinate_santa,c
    all_coordinates <<  current_coodinate_santa
  else
    current_coodinate_robot = move current_coodinate_robot,c
    all_coordinates <<  current_coodinate_robot
  end

  # puts current_coodinate
  index += 1
end

p all_coordinates.uniq.count
