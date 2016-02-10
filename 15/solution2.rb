require 'pry-byebug'

@ingredients = {}

File.readlines("input.txt").each do |line|
  line = line.scan(/(.*): capacity (.*), durability (.*), flavor (.*), texture (.*), calories (.*)/).flatten
  @ingredients[line[0]] = { "capacity" => line[1].to_i, "durability"=> line[2].to_i, "flavor"=> line[3].to_i, "texture"=> line[4].to_i, "calories"=> line[5].to_i}
end

def multiply combination
  # @ingredients.keys.each_with_index do |ingredient,index|
  total = 1
  properties = ["capacity","durability","flavor","texture"]
  names = @ingredients.keys
  properties.each do |property|
    total *= calculate_property(property,combination)
  end
  total = 0 unless calculate_property("calories",combination) == 500 
  total
end

def calculate_property property,combination
  begin
    names = @ingredients.keys
    total = 0
    names.each_with_index do |name,index|
      # binding.pry
      property_total = @ingredients[name][property] * combination[index]
      # puts "property_total #{property} #{property_total}"
      total += property_total
    end
    total = 0 if total < 0
    total
  rescue
    binding.pry
    puts "debug"
  end
end


max = 0

0.upto(100) do |a|
  0.upto(100 - a) do |b|
    0.upto(100 - a - b) do |c|
      d = 100 - a - b - c
      n = multiply [a, b, c, d]
      if n > max
        max = n
        p "#{a},#{b},#{c},#{d}"
      end
    end
  end
end
puts max
