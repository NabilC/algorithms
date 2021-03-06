# 1.1 Is Unique - pg 90
# O(n) time, O(1) space
def is_unique(string)
  letters = Hash.new(0)
  string.each_char { |letter| letters[letter] += 1 }
  letters.none? { |letter, count| count > 1 }
end

# O(n^2) time, O(1) space
def is_unique_no_additional_data_structures(string)
  (0...string.length).each do |i|
    (i + 1...string.length).each do |j|
      return false if string[i] == string[j]
    end
  end

  true
end

# 1.2 Check Permutation
def check_permutation(string1, string2)
  string1.split("").sort == string2.split("").sort
end

def check_perm_char_count(string1, string2)
  counts = Hash.new(0)

  string1.each_char do |char|
    counts[char] += 1
  end

  string2.each_char do |char|
    counts[char] -= 1
  end

  counts.none? { |char, count| count != 0 }
end

def urlify(string)
  string.gsub(" ", "%20")
end

# O(n) time - must look at every letter
def palindrome_perm(string)
  letters = Hash.new(0)
  string.each_char { |char| letters[char] += 1 unless char == " " }
  odd_counts = letters.select { |_, v| v.odd? }
  return false if odd_counts.length > 1
  true
end

def one_away(string1, string2)
  if string1.length == string2.length
    difs = 0
    string1.split("").each_with_index do |char, i|
      difs += 1 if char != string2[i]
    end
    if difs <= 1
      return true
    else
      return false
    end
  elsif (string1.length - string2.length) == 1
    return checkInserts(string2, string1)
  elsif (string1.length - string2.length) == -1
    return checkInserts(string1, string2)
  else
    return false
  end

end

def checkInserts(shorter, longer)
  i = 0
  j = 0
  while i < shorter.length && j < longer.length
    if shorter[i] != longer[j]
      return false if i != j
      j += 1
    else
      i += 1
      j += 1
    end
  end

  true
end
