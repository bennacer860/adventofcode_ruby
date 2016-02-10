require 'pry'
def is_integer? n
  return n.to_i.to_s == n
end

def parse_instructions instructions
  operator = instructions[1].strip
  l_operand = is_integer?(instructions[0]) ? instructions[0].to_i : @wires[instructions[0]].to_i
  r_operand = is_integer?(instructions[2]) ? instructions[2].to_i : @wires[instructions[2]].to_i

  case operator
  when "AND"
    l_operand & r_operand
  when "OR"
    l_operand | r_operand
  when "LSHIFT"
    l_operand << r_operand
  when "RSHIFT"
    l_operand >> r_operand
  end
end

def parse signal,wire
  begin 
    instructions = signal.split(" ")
    case instructions.count 
    when 3
      @wires[wire.strip] = parse_instructions instructions
    when 2
      @wires[wire.strip] = ~instructions[1] 
    when 1
      @wires[wire.strip] = instructions[0]
    end
  rescue
    puts "signal issue"
    # binding.pry
  end
end

@wires = {}
File.readlines('input.txt').each do |line|
  puts line
  line = line.split("->")
  signal = line[0]
  wire = line[1]
  # puts "signal #{signal}"
  # puts "wire #{wire}"
  parse signal,wire
end
p @wires
