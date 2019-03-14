
=begin
	Pedro Lopez
	015892940
	Assignment2
	The Coin Game
=end

# Functions

# Check if taking coins from specified index is valid.
# ie can we take a coin from this index?
def canTake(coinString, index, gapOpen, gapIndex)
	
	# minus one so it doesnt allow taking just the last coin on the right
	if index >= coinString.length-1
		puts "Index #{index} is out of bounds"
		return false
	elsif gapOpen 
		if index == gapIndex or index == gapIndex+1 or index == gapIndex-1
			puts "Index #{index} is a gap"
			return false
		end
	end
	new_gapIndex = index
	return true 
end


# Precondition: Must test with canTake
# returns the coinStr and takenStr
def take(stringTest, selection)
 
	# Split
	coinArray = stringTest.split(//)
	takenStr = coinArray[selection].to_s + coinArray[selection+1].to_s
	puts "Index: #{selection} You Took: #{takenStr} " 

	# Replace taken coins with '-' symbol
	coinArray[selection] = "-"
	coinArray[selection+1] = "-"

	# Join
	coinStr = ""
	coinStr = coinArray.join
	#puts "coinStr: #{coinStr}"

	return coinStr, takenStr
end

# Precondition: Must test with canPlace
def place(coinString, selectionIndex, coinsTaken)

	length = coinString.length
	tempString = coinString

	# add extra spaces to the right to place the coins in.
	if selectionIndex >= coinString.length
		tempString = coinString + "--"
	end

	# Split - Convert Strings into Arrays
	coinArray = tempString.split(//)
	handArray = coinsTaken.split(//)

	# Place coins in hand into coin array
	coinArray[selectionIndex] = handArray[0]
	coinArray[selectionIndex+1] = handArray[1]

	# Join - Convert Array back into a String
	coinStr = ""
	coinStr = coinArray.join

	return coinStr
end

def cleanEnd(coinString, gapIndex)

	subIndex = coinString.length-3
	puts "gapIndex #{gapIndex}"
	puts "subIndex #{subIndex}"

	if gapIndex == subIndex-1
		puts "clean up"
		coinString = coinString[0..subIndex]
		puts"coinString: #{coinString}"
	end
	puts "coinString: #{coinString}"
	return coinString
end

# Variables
MaxTurns = 5
turn = 1
coinString = "HHHHHTTTTT"
spaceString = ""
coinsTaken = ""
userSelection = 0

# One Turn consists of taking and placing down a pair of coins
taking = true
placing = false

# Global Variables
$gapOpen
$placeInGap
$gapIndex
#$new_gapIndex

gapOpen = false
placeInGap = false
gapIndex = 99
new_gapIndex = 999

# Game Loop
puts "Select a coin by pressing space"

# One Turn consists of taking and placing down a pair of coins
while (turn <= MaxTurns)

	puts "\n---------------"
	puts "Turn #{turn}"

	#if the gap is open at the start of the turn 
	# => place the coins in the gap
	#else
	# => plance the coins at the end
	if gapOpen
		placeInGap = true
	end 

	while(taking)

		# Print out the coins string
		puts coinString

		# Get User Input
		spaceString = gets
		userSelection = spaceString.length-1

		if canTake(coinString, userSelection, gapOpen, gapIndex)
			coinString, coinsTaken = take(coinString, userSelection)
			gapOpen = true
			new_gapIndex = userSelection
			taking = false
		else 
			# Choose another spot
			puts "Try Again"
		end
	end

	#If gap is open place coins in the gap
	if placeInGap
		userSelection = gapIndex
		coinString = place(coinString, userSelection, coinsTaken)
		puts "Coins placed in the gap"
	else #place at the end
		userSelection = coinString.length
		coinString = place(coinString, userSelection, coinsTaken)
		puts "Coins placed at the end"
	end

	# Clean up ends
	coinString = cleanEnd(coinString, gapIndex)

	turn = turn+1
	taking = true
	gapIndex = new_gapIndex
end

puts "\n---------------"
puts "Final Result"
puts coinString
puts "\nGame Over\n" 
sleep(20)#wait x seconds before closing program