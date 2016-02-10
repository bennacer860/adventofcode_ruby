require "pry-byebug"
require "set"

TARGET = "HOH"
transitions = {}


File.readlines("input.txt").each do |line|
    from, to = line.scan(/(\w+) => (\w+)/).flatten
    transitions[from] ||= []
    transitions[from] << to
end

puts "TARGET => '#{TARGET}'"
# p transitions

# Part 1
molecules = Set.new

transitions.each do |from, to|
  i = -1
  # puts " #{from} #{i+1} "
  while i = TARGET.index(from, i + 1)
    puts "from: #{from} to: #{to}"
    binding.pry
    # to.each { |t| molecules << TARGET[0...i] + t + TARGET[(i + from.size)..-1] }
  end
end
# p molecules
# p molecules.size

