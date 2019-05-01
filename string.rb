# input: 'aaabbcdd'
# output: 'a3b2c1d2'
# Input: is a string, of letters and no numbers, unordered,
# could be any letter and any number of them
# Output: is a string, it returns each of the letters of the original string,
# and the count of those letters
# 'aaaabbbaaa' -> 'a4b3a3'
# Iterate over the string, maybe want an array?
# each_char
# count the consecutive amount of the same letter, comparison
# test case: input 'a' -> 'a1'
def count_letters(letters)
  return letters if letters == ""
  result = ""
  previous_letter = letters[0]
  count = 0
  letters.each_char do |letter|
    if previous_letter == letter
      count += 1
    else
      result << previous_letter + "#{count}"
      previous_letter = letter
      count = 1
    end
  end
  result << previous_letter + "#{count}"
  result
end

input = "aaaabbcccddd"
p count_letters(input)
# input = ""
# p count_letters(input)
