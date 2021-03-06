# Ruby code file - All your code should be located between the comments provided.
# Main class module. Scaffold provided due to courtesy of Nigel Beacham (scaffold)
module DOND_Game
	# Input and output constants processed by subprocesses. MUST NOT change.


	GOES = 5

	class Game
		attr_reader :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts
		attr_writer :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts

		def initialize(input, output)
			@input = input
			@output = output
		end
		
		def getinput
			@input.gets.chomp.upcase
		end
		
		def storeguess(guess)
			if guess != ""
				@selectedboxes = @selectedboxes.to_a.push "#{guess}"
			end
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.
		@sequence = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		@selectedboxes = []
		@openedboxes = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		@chosenbox = 0
		@selectedbox = 0
		@turn = 0
		@winner = 0
		@played = 0
		@wins = 0
		@losses = 0
		@guess = ""
		@values = [0.01,0.10,0.50,1.00,5.00,10.00,50.00,100.00,250.00,500.00,750.00,1000.00,3000.00,5000.00,10000.00,15000.00,20000.00,35000.00,50000.00,75000.00,100000.00,250000.00]
		@amounts = @values

	def start 
		output.puts 'Welcome to Deal or No Deal!'
		def created_by
			'Nassr Al-Emrani, Aleksandra Siudyka'
		end
		output.puts "Designed by: #{created_by}"
		def student_id
			'51771025, 51659859'
		end
		output.puts "StudentID: #{student_id}"
		output.puts 'Starting game...'
	end
	
		
	def displaymenu
		output.puts "Menu: (1) Play | (2) New | (3) Analysis | (9) Exit"
	end
	
	def resetgame
		@sequence = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		@selectedboxes = []
		@openedboxes = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		@chosenbox = 0
		@selectedbox = 0
		@turn = 0
		@winner = 0
		@played = 0
		@wins = 0
		@losses = 0
		@guess = ""
		@values = [0.01,0.10,0.50,1.00,5.00,10.00,50.00,100.00,250.00,500.00,750.00,1000.00,3000.00,5000.00,10000.00,15000.00,20000.00,35000.00,50000.00,75000.00,100000.00,250000.00]
		@amounts = @values
		
	end
	
	def assignvaluestoboxes
		@sequence = @values.shuffle
	end
	
	def boxvalid(g)
		begin
			guess = Integer(g)
		rescue ArgumentError
			return 1
		end
		return guess > 0 && guess <= 22 ? 0 : 1
	end

	def showboxes
		status = "_";
		symbol = "_";
		for i in (1..22) do
			if @openedboxes[i-1] == 0
				status = "Closed"
				symbol = "[#{i}]"
			else
				status = "Opened"
				symbol = "|#{i}|"
			end

			if i.to_s == @chosenbox
				symbol = "*#{i}*"
			end

			output.print "#{symbol} "
		end
	end
	
	def showamounts
		col1 = 0
		col2 = 11
		for i in (0..10)
			c1 = @amounts[col1 + i]
			c2 = @amounts[col2 + i]
			output.print "\n#{c1}\t#{c2}";
		end
	end
	
	def removeamount (value)
		b= "    "
		@values.map! {|x| x == value ? b : x}
	end
	
	def setchosenbox(b)
		@chosenbox = b
	end

	def getboxvalue(b)
		return @sequence[b.to_i - 1]
	end
	
	def getchosenbox
		return @chosenbox
	end

	def getopenedboxindex
		indexes = []
		
		for i in (0..21) do
			if @openedboxes[i] == 1
				indexes.push(i)
			end
		end

		return indexes
	end
	
	def displaychosenbox
		box = self.getchosenbox
		output.puts "Chosen box: [#{box}]"
	end
	
	def displaychosenboxvalue
		chosen = self.getchosenbox
		output.puts "Chosen box: [#{chosen}] contains: #{@sequence[chosen-1]}"
	end
	
	def displaychosenboxprompt
		output.puts "Enter the number of the box you wish to keep."
	end
	
	def displaychosenboxerror
		output.puts "Error: Box number must be 1 to 22 and it cannot be your primary box."
	end

	def alreadychosen
		output.puts "Error. You cannot choose this box because it is your primary box."
	end
	
	def __displayhelper 
		status = "_";
		symbol = "_";
		
		for i in (1..22) do
			if @openedboxes[i-1] == 0
				status = "Closed"
				symbol = "[#{i}]"
				amount = '';
			else
				status = "Opened"
				symbol = "|#{i}|"
				amount = "Value: #{@sequence[i-1]}"
			end

			output.puts "#{symbol} Status: #{status} #{amount}"
		end
	end

	def displayanalysis
		self.clearScreen
		output.puts "Game analysis..."
		__displayhelper
	end
	
	def showselectedboxes
		output.puts "Log: #{@selectedboxes.inspect}"
	end
	
	def displayselectboxprompt
		output.puts "Enter the number of the box you wish to open. Enter returns to menu."
	end
	
	def openbox(guess)
		openedboxes[guess.to_i - 1] = 1
		__displayhelper
	end

	def openboxsimple(guess)
		openedboxes[guess.to_i - 1] = 1
	end
	
	def bankerphoneswithvalue(offer)
		output.puts "Banker offers you for your chosen box: #{offer}"
	end
	
	def bankercalcsvalue(value)
		fraction = value.to_f / 650766.61
		return (fraction * 250000.00 * 0.8).to_i
	end
	
	def bankercalculation
		sum = 0
		for i in (0..21) do
			if !@selectedboxes.include? i.to_s
				sum = sum + @sequence[i]
			end
		end
		return sum
	end

	def numberofboxesclosed
		openedboxes.reject{ |o| o != 0 }.length
	end
	
	def incrementturn
		@turn +=1
	end
	
	def getturnsleft
		i=GOES-@turn
		return i
	end
	
	def finish
		output.puts "... game finished."
	end
	
	def clearScreen
	   puts "amit"
	   if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
	      system('cls')
	    else
	      system('clear')
	   end
	end
	



		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end


