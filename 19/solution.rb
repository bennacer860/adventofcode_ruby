require 'pry'
require 'set'
molecule = "HOH"
replacements = {}

File.readlines("input.txt").each do |line|
  line = line.scan(/(.*) => (.*)/).flatten
  if replacements[line[0]]
    replacements[line[0]] << line[1]
  else
    replacements[line[0]] = [line[1]]
  end 
end
p replacements
molecules = Set.new

replacements.each do |from,to| 
  0.upto(molecule.size-1) do |index|
    # " ?? #{from} => #{to}"
    to.each do |t|
      puts "#{from} => #{molecule.index(from,index)} in #{molecule}|replace by #{t} | #{index}"
      if molecule.index(from,index)
        new_molecule = molecule.dup
        new_molecule.slice!(index,from.length)
        binding.pry
        new_molecule = new_molecule.insert(index,t)
        molecules << new_molecule
      end
    #   sub_molecule = molecule[index,molecule.size]
    #   sub_molecule = molecule.sub(from,t)
    #   puts "replace #{from}=>#{t} in #{molecule[index,molecule.size]} => #{sub_molecule} " 
    #   molecules << sub_molecule
    end
  end
end
# p replacements
p molecules
