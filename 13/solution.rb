require 'pry'

happiness_rules = Hash.new #{ |hash, key| hash[key] = {}  }


File.readlines("input.txt").each do |rule|
  puts rule
  # binding.pry
  rule = rule.scan(/(.*?) would (.*?) (.*?) happiness units by sitting next to (.*?)\./).flatten
  p1,verb,points,p2 = rule[0], rule[1], rule[2], rule[3]
  bool =  verb == 'gain' ? 1 : -1
  happiness_rules[[p1,p2]] = bool * points.to_i
end

array = happiness_rules.keys.flatten.uniq.permutation.map do |combination|
  total = 0
  # binding.pry
  combination.each_cons(2).each do |pair|
    total += (happiness_rules[pair] + happiness_rules[pair.reverse])
  end
  total += (happiness_rules[[combination[0],combination[-1]]] + happiness_rules[[combination[-1],combination[0]]])
  total
end
p array.max


