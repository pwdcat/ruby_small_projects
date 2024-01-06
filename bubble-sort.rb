def bubble_sort(array)
    while array != array.sort
        array.each_with_index() do |number, index|
            if index + 1 < array.length and number > array[index + 1]
                array[index], array[index + 1] = array[index + 1], array[index]
            end
        end
    end
    array
end

p bubble_sort([4,3,78,2,0,2])