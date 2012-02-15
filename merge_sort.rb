# -*- encoding: utf-8 -*-
require 'pp'

list = %w(28 24 88 74 9 60 21 92 69 20 34 57 84 77 37 87 82 2 86 59 42 14 90 41 39 61 5 31 52 53 64 33 67 8 55 45 75 30 94 80 58 7 50 70 1 76 51 71 25 29 83 49 10 72 19 68 63 32 35 54 89 81 27 78 43 36 40 47 12 16 91 17 23 26 96 4 62 46 65 56 79 93 100 22 66 73 48 95 44 13 3 18 85 15 98 97 11 99 6 38)
#list = %w(2 4 1 5 3)
#list = %w(0 1)

list.map!{|i| i.to_i}

puts "Input:#{list}"

def sort(list)
  puts "Sorting...:#{list}"
  
  result = []
  if list.size > 2
    half = list.size/2
    
    left = sort(list.first(half))
    right = sort(list.last(list.size-half))
    
    print "Merge.:#{left} and #{right}"
    result.push(left.first < right.first ? left.shift : right.shift) until left.empty? or right.empty?
    result += left + right
    puts " -> #{result}"
  else # list.size <= 2
    if list.size == 2 and list[0] > list[1]
      result = list.reverse
    else
      result = list
    end
  end
  
  puts "Sorted.:#{list} -> #{result}"
  return result
end

puts "Output:#{sort(list)}"
