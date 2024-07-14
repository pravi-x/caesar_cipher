# Implement a caesar cipher that takes in a string and 
# the shift factor and then outputs the modified string:
def letter?(lookAhead)
  lookAhead.match?(/[[:alpha:]]/)
end

def upper?(char)
  char.match?(/[[:upper:]]/)
end

def caesar_cipher(string, number)
  cipher = []
  # split the cipher in characters to change them 
  charachers = string.split('')
  charachers.each_with_index do |c, index|
    if !letter?(c)
      # skip the not letters char
      cipher[index] = c
      next 
    end

    # check if the c is upper case
    to_capitalize = upper?(c)
    c.downcase!

    if (c.ord + number) <= "z".ord
      # change the character if the new one is  before "z"
      cipher[index] = (c.ord + number).chr
    else
      # if the new one is after "z", go through the alphabet again
      position_in_alphabet = "z".ord - (c.ord + number) +3
      cipher[index] = ("a".ord + position_in_alphabet).chr
    end

    # upcase if necessary
    if to_capitalize
      cipher[index] = cipher[index].upcase
    end
  end
  cipher.join.capitalize
end

puts caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"