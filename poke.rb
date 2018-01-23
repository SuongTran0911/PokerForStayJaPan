module Hands
	def self.readRank(poker)
		$i = 0
		$i2 = 0
		listValuePoker = Array.new
		listIndexOfTen = poker.enum_for(:scan, /(?=10)/).map { Regexp.last_match.offset(0).first }
		if(listIndexOfTen.any? == true)
			while $i2 < listIndexOfTen.count
				listValuePoker.push("10")
				poker = poker.gsub('10', '')
				$i2 += 1
			end
		end
		poker.split("").each do |i|
			if(i != 'S' && i != 'H' && i != 'D' && i != 'C')
				listValuePoker.push(i)
			end
			$i += 1
		end 
		listValuePoker = listValuePoker.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
		return listValuePoker.values
	end
	def self.TypeHands(rank1, rank2)
		result = String.new
			if (rank1 == 3 && rank2 != 2)
				result = '3C'
			elsif (rank1 == 3 && rank2 == 2)
				result = 'FH'
			elsif (rank1 == 2 && rank2 != 2)
				result = '1P'
			elsif (rank1 == 2 && rank2 == 2)
				result = '2P'
			elsif(rank1 == 4)
				result = '4C'
			else result = '--'
			end
			return result
		end	
		
	end
puts 'Enter 5 poker'
		a = gets.chomp
		@listValuePoker = Hands.readRank(a)
		@listValuePoker = @listValuePoker.sort{|a, z| z <=> a}
		result = Hands.TypeHands(@listValuePoker[0], @listValuePoker[1])
		puts result
		
