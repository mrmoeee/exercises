# Phase 1
# Time Complexity: n! + n
def first_anagram?(string, strong)
  anagram = string.chars.permutation.to_a
  anagram.include?(strong.split(''))
end

# Phase 2
# Time Complexity: n
def second_anagram?(string, strong)

  s_chars = string.chars
  ss_chars = strong.chars

  string.length.times do
    letter = s_chars.shift
    return false unless ss_chars.index(letter)
    ss_chars.delete_at(ss_chars.index(letter))
  end

  ss_chars.empty?
end

# Phase 3
# Time Complexity: n
def third_anagram?(string, strong)
  string.chars.sort == strong.chars.sort
end

# Phase 4
# Time Complexity: n
def fourth_anagram?(string, strong)
  s_hash = Hash.new(0)
  ss_hash = Hash.new(0)
  string.chars.each do |el|
    s_hash[el] += 1
  end
  strong.chars.each do |el|
    ss_hash[el] += 1
  end
  s_hash.to_a.sort == ss_hash.to_a.sort
end

def fourth_anagram?(string, strong)
  s_hash = Hash.new(0)
  string.chars.each do |el|
    s_hash[el] += 1
  end
  strong.chars.each do |el|
    s_hash[el] -= 1
  end

  s_hash.all? {|_,v| v == 0}

end
