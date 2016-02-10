require 'pry'

def find_number input
  input.scan(/(-*\d+)/).flatten.map(&:to_i).reduce(:+)
end

input = File.read("input.txt")
s = '{"a":2,"b":4}'
puts find_number input
