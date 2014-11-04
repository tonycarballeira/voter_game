class Person
	@@id = 0
	@@persons = []
	attr_accessor :name, :politics, :id, :persons
	def initialize(name, politics)
		@name = name
		@politics = politics
		@id = @@id
		@@id += 1
		@@persons << self
	end
	def self.all_persons
		@@persons
	end
 
end
 
class Politician
	@@id = 0
	@@politicians = []
	attr_accessor :name, :party, :id, :politicians, :votes
	def initialize(name, party)
		@name = name
		@party = party
		@id = @@id
		@@id += 1
		@@politicians << self
		@votes = 0
		@votes = @votes + 1
	end
 
	def self.all_politicians
		@@politicians
	end
end
 
 
voted_already = []
voters = []
republican = []
democrat = []
all_people = []
all_people.push(voters).push(democrat).push(republican)
politicians = []
politicians.push(democrat).push(republican)
dem_prim_win = []
rep_prim_win = []
 
 
20.times do
puts "What would you like to do? Create, List, Update, or Vote"
option1 = gets.chomp.to_s.downcase
 
case option1
	when "create"
		puts "What would you like to create? Politician or Person"
		option_p_or_p = gets.chomp.to_s.downcase
			if option_p_or_p == "politician"
				puts "Name?"
				pol_name = gets.chomp.to_s.downcase
				puts "Party? Democrat or Republican"
				pol_par = gets.chomp.downcase
					if pol_par == "democrat"
						democrat << Politician.new(pol_name, pol_par)
					elsif pol_par =="republican"
						republican << Politician.new(pol_name, pol_par)
					else
						puts "Invalid Entry"
					end
				elsif option_p_or_p == "person"
				puts "Name?"
				per_name = gets.chomp.to_s.downcase
				puts "Politics? Liberal, Conservative, Tea Party, Socialist, or Neutral"
				politic_view = gets.chomp.to_s.downcase
		        voters << Person.new(per_name, politic_view)
			else
				puts "Invalid Entry"
			end
	
	
	when "list"
		puts "Here is your list of all Politicians and Persons:"
		p all_people
		
	
	when "update"
		puts "Who would you like to update? Politician or Person?"
		p_or_p = gets.chomp.to_s.downcase
			all_people.each do |x|
				if p_or_p == "person"
					puts "What is this person's name?"
					person_name = gets.chomp.to_s.downcase
						if x.name == person_name
							puts "What would you like to change #{person_name}'s name to?"
							new_voter_name = gets.chomp.to_s.downcase
							x.name = new_voter_name
							puts "The name was Updated to #{x.name}"
								puts "What will this person's political affiliation be? Liberal, Conservative, Tea Party, Socialist, or Neutral?"
								new_politics = gets.chomp.to_s.downcase
								x.politics = new_politics
								puts "You changed political affiliation to #{x.politics}"
						else
							puts "Invalid Entry"
						end
				else
					puts "Invalid Entry. Person not in list"
				end
 
				if p_or_p == "politician"
					puts "What is this politician's name?"
					politician_name = gets.chomp.to_s.downcase
						if x.name == politician_name
							puts "What would you like to change #{politician.name}'s name to?"
							new_pol_name = get.chomp.to_s.downcase
							x.name = new_pol_name
							puts "The name was Updated to #{x.name}"
								puts "What will this Politician's Party be? Democrat or Republican?"
								pol_par2 = gets.chomp.to_s.downcase
								x.party = pol_par2
								puts "The Political Party was changed to #{x.party}"
							else
								puts "Invalid Entry"
							end
				else
					puts "Invalid Entry. Politician not in list"
				end
			end	
 
 
	when "vote"
	if (democrat.length > 0) && (republican.length > 0)
		
 
		dem_prim_win << democrat.sample
	        
        rep_prim_win << republican.sample
		
 
		puts "A Democratic and Republican primary election was conducted. The Republican candidate is #{rep_prim_win[0].name}!  The Democrat candidate is #{dem_prim_win[0].name}! \n"
		puts "And there off! the campaign begins!!!!!\n"
		rep_prim_win.each do |x|
			dem_prim_win.each do |y|
				if x.name != y.name
					puts "Politician #{y.name}, laughed at Politician #{x.name}'s attempt to win his/ her vote"
				else
					puts "#{x.name} voted for himself/ herself"
				end
			end
		end
		dem_prim_win.each do |x|
			rep_prim_win.each do |y|
				if x.name != y.name
					puts "Politician #{y.name}, laughed at Politician #{x.name}'s attempt to win his/ her vote"
				else
					puts "#{x.name} voted for himself/ herself"
				end
			end
		end
		rep_prim_win.each do |x| 
			voters.each do |y|
				unless voted_already.include? y then
					if y.politics == "tea party"
						perc1 = rand(0..100)
							if perc1 < 91
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "conservative"
						perc2 = rand(0..100)
							if perc2 < 76
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "neutral"
						perc2 = rand(0..100)
							if perc2 < 51
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "liberal"
						perc2 = rand(0..100)
							if perc2 < 26
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "socialist"
						perc2 = rand(0..100)
							if perc2 < 11
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					end
				end
			end
		end
		dem_prim_win.each do |x|	
			voters.each do |y|
				unless voted_already.include? y then
					if y.politics == "tea party"
						perc1 = rand(0..100)
							if perc1 < 11
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "conservative"
						perc2 = rand(0..100)
							if perc2 < 26
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "neutral"
						perc2 = rand(0..100)
							if perc2 < 51
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "liberal"
						perc2 = rand(0..100)
							if perc2 < 76
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					elsif y.politics == "socialist"
						perc2 = rand(0..100)
							if perc2 < 91
								puts "#{y.name} voted for #{x.name}!"
								x.votes += 1
								voted_already << y
							else
								puts "#{y.name} did not vote for #{x.name}"
							end
					end
				end
			end
		end
	else
		puts "There arent enough candidates, we cant start the election. Input at least one candidate for each party."
	end	
	
			
			winner = dem_prim_win[0].votes <=> rep_prim_win[0].votes
 
			if winner == -1
				puts "The winner of the election is #{rep_prim_win[0].name}!!!!!\n"
				puts "This concludes the Election"
			elsif winner == 0
				puts "The election resulted in a tie!!!!\n"
				puts "This concludes the Election"
			elsif winner == 1
				puts "The winner of the election is #{dem_prim_win[0].name}!!!!!!\n"
				puts "This concludes the Election"
			else
				puts "No tie, No winner, No nothing"
			end	
		
			exit
		
		
	else
		puts "Thats is not a valid entry"
	end
 
end