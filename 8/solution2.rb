require 'pry-byebug'

score = 0
File.open("input.txt").readlines.each do |line|
  line = line.chomp
  encoded_score = line.inspect.length
  code_score = line.length
  score += (encoded_score - code_score)
end
p score
