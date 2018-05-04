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
    return if length<=1
    pivpos = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, pivpos-start, &prc)
    QuickSort.sort2!(array, pivpos+1, length-(pivpos-start)-1, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{|a,b| a<=>b}
    pivot = array[start]
    counter = 1
    pivpos = start
    while counter<length
      if prc.call(pivot,array[start+counter])>=0
        array[pivpos], array[counter+start] = array[counter+start], pivot
        pivpos = counter+start
        counter+=1
      else
        array[start+counter], array[start+length-1] = array[start+length-1], array[counter+start]
        length-=1
      end
    end
    pivpos
  end
end

def merge_ints(arrs)
  prc = Proc.new{|a,b| a[0] <=> b[0]}
  QuickSort.sort2!(arrs, 0, arrs.length, &prc)
  counter = 0
  ret = []
  while counter<arrs.length-1
    print ret
    temp = arrs[counter]
    while counter<arrs.length-1 && temp[1] >= arrs[counter+1][0]
      temp[1] = arrs[counter+1][1] unless temp[1]>arrs[counter+1][1]
      counter+=1
    end
    ret.push(temp)
    counter+=1
    ret.push(arrs[counter]) if counter==arrs.length-1
  end
  ret
end
