require 'pry'

def parse string
  string.chars.chunk{|a| a}.map{|a| [a[1].count,a[0]]}.to_a.flatten.join
end
p parse("1")
p parse("111221")
s = "1113122113"
50.times do
  s = parse(s) 
end
p s.chars.count
