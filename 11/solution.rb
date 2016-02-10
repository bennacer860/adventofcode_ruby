require 'pry'
def meet_first_requirement password
  password.chars.map(&:ord).each_cons(3).any? do |a,b,c|
    b-a == 1 && c-b == 1
  end
end

def meet_second_requirement password
  password.scan(/(i|o|l)/).empty?
end

def meet_third_requirement password
  password.scan(/(.)\1/).count >= 2
end

def valid_password? password
  meet_first_requirement(password) && meet_second_requirement(password) && meet_third_requirement(password)
end

def find_next_password password
  password = password.next
  while( !valid_password?(password) ) do
    password = password.next
  end
  password
end

string = "vzbxkghb"
string = "vzbxxyzz"
# string = "abcd"
puts find_next_password string
# puts find_next_password "abcdefgh"
# puts string
puts meet_first_requirement string
