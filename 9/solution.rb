require 'pry-byebug'
distances = {}

File.readlines("input.txt").each do |line|
  line = line.chomp
  /(.*) to (.*) = (.*)/.match(line)
  location1,location2,distance = $1,$2,$3
  distances[[location1,location2]] = distance.to_i
  distances[[location2,location1]] = distance.to_i
end

paths_distance = distances.keys.flatten.uniq.permutation.to_a.map{ |itinerary|
  itinerary.each_cons(2).map{|d| distances[d]}.inject(:+)
}
  
puts paths_distance.min
puts paths_distance.max
