require 'pry-byebug'

score = 0
File.open("input.txt").readlines.each do |line|
  line = line.chomp
  code_score = line.length
  character_score = eval(line).length
  score += (code_score - character_score)
end
p score
