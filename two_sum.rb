
def bad_two_sum?(arr, target_sum)
    
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            if (arr[i] + arr[j]) == target_sum
                return true
            end
        end
    end
    false
end
# Time complaxity is Quaratic O(n^2)

# arr = [8, 1, 7, 13, 6, 5, 0]
arr = [12, 22, 34, 11, 200, 8, 1, 7, 13, 6, 5, 0]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
puts "------------------"



def okay_two_sum?(arr, target_sum)
    sorted = arr.sort

    i = 0
    j = sorted.length - 1

    while i < j
        case (sorted[i] + sorted[j]) <=> target_sum
        when 0
            return true
        when -1
            i += 1
            # j -= 1
        when 1
            j -= 1
            # i += 1
        end
    end
    false
end

arr = [8, 1, 7, 13, 6, 5, 0]
# arr = [12, 22, 34, 11, 200, 8, 1, 7, 13, 6, 5, 0]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
puts "------------------"

def okay_two_sum_with_bsearch?(arr, target_sum)
    arr = arr.sort
    arr.each_with_index do |ele1, i|
        match_idx = arr.bsearch_index { |ele2, j| (target_sum - ele1) <=> ele2 }
        return true if match_idx && match_idx != i
    end
    false
end

arr = [8, 1, 7, 13, 6, 5, 0]
# arr = [12, 22, 34, 11, 200, 8, 1, 7, 13, 6, 5, 0]
p okay_two_sum_with_bsearch?(arr, 6) # => should be true
p okay_two_sum_with_bsearch?(arr, 10) # => should be false
puts "------------------"


def two_sum_hash?(arr, target_sum)
    # hash = arr.tally
    # p hash
    # hash.each do |k, v|
    #     target = target_sum - k
    #     hash.shift unless v > 1
    #     if hash.has_key?(target)
    #         p hash
    #         return true
    #     end
    # end
    # p hash
    # false
    hash = {}
    arr.each do |n|
        target = target_sum - n
        if hash[target]
            return true
        end
        hash[n] = true
    end
    false
end


arr = [8, 1, 7, 13, 6, 5, 0]
# arr = [12, 22, 34, 11, 200, 8, 1, 7, 13, 6, 5, 0]
p two_sum_hash?(arr, 6) # => should be true
p two_sum_hash?(arr, 10) # => should be false
puts "------------------"


