def bubble_sort(array)
  sorted     = false
  passes     = 0
  max_passes = array.size - 1

  until sorted == true do
    swapped = false

    array.each_with_index do |number, index|
      break if index == array.size - passes - 1

      if number > array[index + 1]
        array[index]     = array[index + 1]
        array[index + 1] = number
        swapped = true
      end

    end

    passes += 1

    sorted = true if passes  == max_passes
    sorted = true if swapped == false
  end

  p array
end

bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]