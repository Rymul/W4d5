require "byebug"

def first_anagram?(str1, str2)
    anagrams = str1.chars.permutation.to_a
    anagrams.map! {|word| word.join}

    anagrams.include?(str2)
end
# Time complexity is factorial O(n!)

p "Phase 1"
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
p first_anagram?("abcdefghi", "acbfdeigh")    #=> true
puts "--------------------"




def second_anagram?(str1, str2)
    str1.each_char do |char|
        i = str2.index(char)
        if i != nil
           str2 = str2.delete(char)
        end
    end
    str2.empty?
end
# Time complexity is either Quadratic O(n^2)

p "Phase 2"
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p second_anagram?("abcdefghijk", "acbfdeighkj") #=> true
puts "--------------------"




def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort   
end
# Time complexity is Linearithmic O(n log n)

p "Phase 3"
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
p third_anagram?("abcdefghijk", "acbfdeighkj") #=> true
puts "--------------------"



def fourth_anagram?(str1, str2)
    hash_1 = str1.split("").tally
    hash_2 = str2.split("").tally
    hash_1 == hash_2
end
# Time complexity is Linear O(n)

    #version 2 with one hash
def fourth_anagram_v2?(str1, str2)
    hash = Hash.new(0)

    (0...str1.length).each do |i|
        key1, key2 = str1[i], str2[i]
        hash[key1] += 1
        hash[key2] -= 1
    end

    hash.each_value do |v|
        return false if v != 0
    end
    true
end
# Time complexity is Linear O(n)

p "Phase 4"
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("abcdefghijk", "acbfdeighkj") #=> true
puts "--------------------"


p "Phase 4 v2"
p fourth_anagram_v2?("gizmo", "sally")    #=> false
p fourth_anagram_v2?("elvis", "lives")    #=> true
p fourth_anagram_v2?("abcdefghijk", "acbfdeighkj") #=> true
puts "--------------------"





