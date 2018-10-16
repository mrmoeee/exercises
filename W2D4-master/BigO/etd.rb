# Phase 1
# Time Complexity: n^2
def my_min(arr)
  smallest = arr.first
  arr.each_index do |idx|
    j = idx + 1
    (j...arr.length).each do |idx2|
      smallest = arr[idx2] if arr[idx2] < smallest
    end
  end
  smallest
end

# Phase 2
# Time Complexity: n
def my_min2(arr)
  smallest = arr.shift
  arr.each { |el| smallest = el if el < smallest }
  smallest
end

# Phase 1
# Time Complexity: n^3 
def lcs(arr)
  result = []
  # n!
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      result << arr[i..j]
    end
  end
  # n
  sum = result.shift.reduce(:+)
  result.each do |arr|
    sum = arr.reduce(:+) if sum < arr.reduce(:+)
  end
  sum
end

# Phase 2
# Time Complexity:

def array(array)

  arr = array.dup
  return arr.max if arr.all? { |el| el <= 0 }
  first = arr.shift
  current = first
  largest = first

  arr.each_index do |i|
    current = 0 if current + arr[i] < 0
    current += arr[i] if current + arr[i] >= 0
    largest = current if current > largest
  end

  largest
end
