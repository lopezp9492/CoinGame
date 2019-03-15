=begin
	Pedro Lopez
	Assignment2
	ArrayPartitioner
=end

# reorders an array based on the given test value
def partition(array, testValue)

	# Debug
	tag = "partition."
	puts "\n"
	puts tag + "(array, testValue)"
	puts tag + "(#{array}, #{testValue})"

	left_index = 0
	right_index = array.length-1

	#Debug
	puts "left_index: #{left_index}"
	puts "right_index: #{right_index}"

	#Debug 
	puts "\n"
	l_value = array[left_index]
	r_value = array[right_index]
	puts "array[left_index] #{l_value}"
	puts "array[right_index] #{r_value}"

	# While markers have not crossed each other
	while(left_index < right_index)

		#Debug 
		puts "\n---------------"
		l_value = array[left_index]
		r_value = array[right_index]
		puts "array[left_index] #{l_value}"
		puts "array[right_index] #{r_value}"

		# Debug
		puts "left_index: #{left_index}"
		puts "right_index: #{right_index}" 
		#sleep(1) # wait x seconds before closing program

		if(l_value > testValue and r_value < testValue)	
			# Swap
			temp = array[left_index]
			array[left_index] = array[right_index]
			array[right_index] = temp
		end

		#Move left_index forward
		while(array[left_index]<testValue)
			puts"move forward"
			left_index = left_index+1
		end

		#Move right_index back
		while(array[right_index]>testValue)
			puts"move back"
			right_index = right_index-1
		end
	end

	# Debug
	puts array.inspect

	#returns the point where the test value divides the array
	if(array[left_index]>testValue)
		left_index -= 1
	end
	return left_index, array

end


# Variables
array = []
testValue = 0
inputSize = 0
p_index = 0

# Get User Input
puts "Enter the number of elements in the array: n"
inputSize = gets.to_i

i = 0
x = 0
while(i<inputSize)
	puts "Enter value #{i}:"
	x = gets.to_i
	array.push(x)
	i+=1
end

puts"Enter Test Value"
testValue = gets.to_i

# Display Array Contents
puts array.inspect

# Call function
p_index, array = partition(array, testValue)

# Print Result
puts "\n---------------"
puts "Result"
puts array.inspect
puts "p index #{p_index}"
sleep(10) # wait x seconds before closing program