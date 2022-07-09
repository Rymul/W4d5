
def my_min(arr)
    arr.each do |e1|
        arr.each do |e2|
            if e1 > e2
                return e2
            end
        end
    end
end
# time complexity is Quadratic O(n^2)



def my_min_2(arr)
    min = 0
    arr.each {|ele| min = ele if min > ele}
    min
end
# time complexity is Linear O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)
# p my_min_2(list)
# puts "-------------"



def largest_contiguous_subsum(list)
    subs = []

    (0...list.length).each do |i|
        (i...list.length).each do |j|
            subs << list[i..j]
        end
    end

    sum = subs[0].sum
    subs.each_with_index do |pair, i|
        if pair.sum > sum
            sum = pair.sum
        end
    end
    sum
end
# Time complexity is Polynomial O(n^3)

def largest_contiguous_subsum_2(list)
    largest = list.min
    current = list.first
    (1...list.length).each do |i|
        current = 0 if current < 0
        current += list[i]
        p current
        largest = current if current > largest
    end
    largest
end
# Time complexity is Linear O(n)


# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # 8
# list_2 = [2, 3, -6, 7, -6, 7]
# puts
# p largest_contiguous_subsum(list_2) # 8
# list_3 = [-5, -1, -3]
# puts
# p largest_contiguous_subsum(list_3) # -1

list = [5, 3, -7]
p largest_contiguous_subsum_2(list) # 8
list_2 = [2, 3, -6, 7, -6, 7]
puts
p largest_contiguous_subsum_2(list_2) # 8
list_3 = [-5, -1, -3]
puts
p largest_contiguous_subsum_2(list_3) # -1
puts "-------------"







