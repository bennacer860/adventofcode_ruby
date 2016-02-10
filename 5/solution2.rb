require "minitest/autorun"

def contains_at_least_3_vowels string
  vowels = "aeiou"
  # p string.split('').select{|letter| vowels.include? letter}
  string.split('').select{|letter| vowels.include? letter}.count > 2
end

def contains_letter_that_appears_twice string
  doubles = ('a'..'z').to_a.map{|a| "#{a}#{a}"}
  # string.include? 
  doubles.select{|double| string.include? double}.any?
end

def contains_specific_strings string
  stop_words = %w{ab cd pq xy}
  stop_words.select{|stop_word| string.include? stop_word}.any?
end

def contains_pair_of_two_letters string
  string =~ /(.).\1/
end

def contains_pattern string
  string =~ /(..).*\1/ 
end

def validate string
  # puts "validate..."
  # puts "specific string" if contains_specific_strings string
  return false if contains_specific_strings string
  # puts "at least 3 vowels" if !contains_at_least_3_vowels string
  return false if !contains_at_least_3_vowels string
  # puts "letters appear twice" if !contains_letter_that_appears_twice string
  return false if !contains_letter_that_appears_twice string
  true
end

def validate2 string
  return (contains_pattern string  and contains_pair_of_two_letters string)
end

class TestMeme < Minitest::Test
  def test_contains_specific_strings
    assert contains_specific_strings "dfsafsacd"
    refute contains_specific_strings "aaaaaa"
  end

  def test_contains_letter_that_appears_twice
    assert contains_letter_that_appears_twice "aafewfewfewdd"
  end

  def test_contains_at_least_3_vowels
    assert contains_at_least_3_vowels 'aei'
    assert contains_at_least_3_vowels 'aaa'
    assert contains_at_least_3_vowels 'xazegov'
    assert contains_at_least_3_vowels 'aeiouaeiouaeiou'
  end

  def test_contains_pair_of_two_letters
    assert contains_pair_of_two_letters 'qjhvhtzxzqqjkmpb'
  end

  def test_contains_pattern
    assert contains_pattern 'qjhvhtzxzqqjkmpb'
    assert contains_pattern 'xxyxx'
  end

  def test_validate
    assert validate "ugknbfddgicrmopn"
    assert validate "aaa"
    refute validate "jchzalrnumimnmhp"
    refute validate "haegwjzuvuyypxyu"
    refute validate "dvszwmarrgswjxmb"
  end
  
end

index  = 0
index2 = 0
File.open("input.txt").each_line do |line|
  index += 1 if validate line
  index2 += 1 if validate2 line
end
puts index
puts index2
