def my_uniq(arr)
#return uniq arr
  hash = Hash.new  
  arr.each do |el| 
    hash[el] = 0 
  end
  hash.keys
end

class Array

  def two_sum
    result = []
    length.times do |idx|
      j = idx + 1
      (j...length).each do |idx2|
        result << [idx, idx2] if (self[idx] + self[idx2]).zero?
      end
    end
    result
  end
  
end

def my_transpose(arr)
  raise TypeError unless arr.all? { |el| el.is_a?(Array) }
  return [] if arr.all? { |el| el.empty? }
  transposed = Array.new(arr.length) { Array.new(arr[0].length)}
  arr.each_index do |idx|
    arr[idx].each_index do |idx2| 
      transposed[idx2][idx] = arr[idx][idx2]
    end 
  end
  transposed
end


def stock_market(array)
  return nil if array.length <= 1
  hsh = Hash.new
  array.each_index do |idx1|
    j = idx1 + 1
    (j...array.length).each do |idx2|
      hsh[[idx1, idx2]] = array[idx2] - array[idx1]
    end
  end
  hsh.to_a.sort_by {|k,v| v}.last.first
end