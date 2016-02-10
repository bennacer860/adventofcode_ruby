require 'pry'

reindeers = {}
File.readlines("input.txt").each do |line|
  input = line.scan(/(.*) can fly (.*) km\/s for (.*) seconds, but then must rest for (.*) seconds./)
  input = input.flatten
  name,speed,speed_duration,rest_duration = input[0],input[1],input[2],input[3]
  reindeers[name] = {"fly" => speed.to_i, "speed_duration" => speed_duration.to_i, "rest" => rest_duration.to_i}
end
p reindeers

arrival_time = 1

def calcualte_distance reindeers,name,arrival_time
  distance = 0
  time = 0
  need_rest = false
  distance += reindeers[name]["fly"] * reindeers[name]["speed_duration"]
  time += reindeers[name]["speed_duration"]

  need_rest = true
  while( time < arrival_time ) do
    if need_rest
      time += reindeers[name]["rest"]
      need_rest = false
    else
      distance += reindeers[name]["fly"] * reindeers[name]["speed_duration"]
      time += reindeers[name]["speed_duration"]
      need_rest = true
    end
  end
  
  if time > arrival_time 
    if need_rest
      # puts "was flying"
      # puts "you counted #{time-arrival_time}s => #{(time-arrival_time)*reindeers[name]["fly"]}km"
      distance -= (time-arrival_time)*reindeers[name]["fly"]
    # else
      # puts "was resting"
    end
  end
  distance
  # p time
  # p distance
end

# calcualte_distance reindeers, "Dancer",1
p reindeers.keys.map{ |name| calcualte_distance reindeers,name,2503 }.max
