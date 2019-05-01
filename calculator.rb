# Implement a calculator:
# Takes a single string as a param
# String will be "1,2", for that input we expect 3 to get outputted as an integer
# * Only one number, can just return that number
# * String will need to be converted to an integer
# * Output is an integer
#
# * Variable named output, that is keeping track of all of the values
# * String, we know it's a comma:
# ** .split - will turn string to array, (",") will divide string by commas
# ** Array, iterate over and add each value reduce(+)

def calculate(str)
  sum = 0
  str.split(",").each do |x|
    sum += x.to_i
  end
  sum
end

str = "1,2"
p calculate(str)
