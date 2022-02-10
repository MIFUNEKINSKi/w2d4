require "byebug"

def no_dupes?(arr)
    count = Hash.new(0)
    arr.each {|ele| count[ele] += 1 }
    count.select {|k,v| v == 1}.keys

end 

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] == arr[i+1]
            return false
        end 
    end 
true

end 

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    # return hash 
    new_hash = {}
    str.each_char do |char|
        new_hash[char] = indecise_finder(char, str)
    end
    new_hash
end 

def indecise_finder(char, str)
    i = 0 
    final = []
    while i < str.length 
        if str[i] == char
            final << i
        end 
        i += 1 
    end 
    final
end 


# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
def longest_streak(str)
    new_hash = {}
    i = 0 
    while i < str.length
        current = str[i]
        count = 0 
        while current == str[i]
            count += 1 
            i += 1
        end 
        new_hash[current] = count
    end 
    sorted = new_hash.sort_by{|k,v| v}
    most = sorted[-1]
    return most[0] * most[1]
end 


# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    factors = (2...num).select {|n| num % n == 0}
    p_factors = factors.select {|n| is_prime?(n)}
   
    if p_factors.length == 1
        return true if p_factors[0] * p_factors[0] == num
    end 

    (0...p_factors.length - 1).each do |i|
        (i...p_factors.length).each do |j|
            if p_factors[i] * p_factors[j] == num
                return true
            end 
        end 
    end 
false
end 

def is_prime?(num)
    (2...num).none?{|n| num % n == 0}
end 


# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, keys)
        new_str = ""
        alphabet = ("a".."z").to_a
        # debugger

        
            # debugger
            str.each_char do |char|
            until new_str.length == str.length
            i = 0 
            new_idx = i % keys.length
            key = keys[i]
            old_idx = alphabet.index(char)
            new_idx = (old_idx + key) % alphabet.length
            new_str += alphabet[new_idx]

            i += 1
            end 
        end 

        new_str
end 

"John's solution"

# def cipher(word, num)
#     alpha = ("a".."z").to_a
#     ciphered = []

#     word.each_char.with_index do |char, i|
#         char_alpha_idx = alpha.index(char)
#         ciphered << alpha[(char_alpha_idx + num) % 26]
#     end
#     ciphered.join('')
# end



# def vigenere_cipher(message, keys)
#     ciphered = []

#     message.each_char.with_index do |char, i|
#         ciphered << cipher(char, (keys[i % keys.length]))
#     end
#     ciphered.join('')
# end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"