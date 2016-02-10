require 'pry-byebug'
@wires = {}
def is_integer? n
  Float(n) != nil rescue false
  # return n.to_i.to_s == n
end


def first_pass
  File.readlines('input.txt').each do |line|
    line = line.split("->")
    signal = line[0].strip
    wire = line[1].strip
    @wires[wire] = signal
  end
  @wires['b'] = 16076
  # binding.pry
end


def parse wire
  # puts "enter wire #{wire}"
  # binding.pry if wire == 'h'
  # we are dealing with an integer
  return wire.to_i if is_integer? wire
  # the gate has a value in our hash
  wire = wire.strip
  return @wires[wire].to_i if is_integer? @wires[wire] 
  # the gate has a signal
  signal = @wires[wire]
  tokens = signal.split(" ")
  value = case tokens.count
  when 3
    operator = tokens[1]
    left_operand = tokens[0]
    right_operand = tokens[2]
    case operator
    when "AND"
      puts " store #{wire}"
      @wires[wire] = parse(left_operand) & parse(right_operand)
    when "OR"
      puts " store #{wire}"
      @wires[wire] = parse(left_operand) | parse(right_operand)
    when "LSHIFT"
      puts " store #{wire}"
      @wires[wire] = parse(left_operand) << parse(right_operand)
    when "RSHIFT"
      puts " store #{wire}"
      @wires[wire] = parse(left_operand) >> parse(right_operand)
    end
  when 2
    puts " store #{wire}"
    @wires[wire] = ~ parse(tokens[1])
  else
    puts " store #{tokens[0]}"
    # puts @wires
    @wires[wire] = parse(tokens[0])
  end
  # puts "exit #{wire}"
  value
end


first_pass
# p @wires
gate = 'a'
puts "#{gate} -> #{parse gate}"
# p @wires
