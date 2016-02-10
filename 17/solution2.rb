input = [33,14,18,20,45,35,16,35,1,13,18,13,50,44,48,6,24,41,30,42]

(0..input.size).flat_map{|size| input.combination(size).to_a }.reject{|c| c.inject(:+) != 150 }.map(&:size).tap{|a| min=a.min;puts a.count(min)}
