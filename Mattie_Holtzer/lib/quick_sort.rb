class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    arr2 = []
    arr3 = []
    array[1..array.length].each do |val|
      arr2.push(val) if val<=pivot
      arr3.push(val) if val>pivot
    end
    QuickSort.sort1(arr2) + [pivot] + QuickSort.sort1(arr3)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    QuickSort.sort1(array)
  end

  def self.partition(array, start, length, &prc)
  end
end
