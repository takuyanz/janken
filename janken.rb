#coding: utf-8

require "color_text"

# Janken means paper, sicissors, rock in Japanese
class Janken

	def initialize
		
		@hands = ["Paper", "Sicissors", "Rock"]
		puts "\n RUBY JANKEN".purple
		print "\n What is your name? ".blue
		@user_name = gets.chomp
		@cpu_name = "Ruby"
		
		ask_for_a_hand
	end

	def ask_for_a_hand
		puts "\n 1, Paper 2. Sicissors 3.Rock".red
		print "\n Please select a number ".blue

		input = gets.chomp.to_i
		if([1,2,3]).include? input
			@user_hand = input
			@cpu_hand = rand(1..3)
			start_game(@cpu_hand, @user_hand)	
		else
			ask_for_a_hand
		end
	end

	def start_game(cpu_hand, user_hand)
		num = (user_hand - cpu_hand)
		
		shout

		if num == 1 || num == -2 
			puts "\n - #{@user_name} Wins! -".green
		elsif num == -1 || num == 2 
			puts "\n - #{@cpu_name} Wins! -".green
		else  num == 0
			puts "\n - Draw -".green
			ask_for_a_hand
		end
			
		play_again
	end

	def shout
		puts ""
		(1..3).each do |i|	
			if i == 1 then 
				puts " Paper..".neon
				sleep(1)
				i += 1
			elsif i == 2 
				puts "\n Scissors,,".neon
				sleep(1)
				i += 1
			else 
				puts "\n ROCK!!".neon
				show_hands
			end
		end
	end
	
	def play_again
		print "\n Want to play again? (y/n) ".blue
		yesno = gets.chomp.downcase
		
		if yesno == "y"
			ask_for_a_hand
		else 
			puts " bye bye, #{@user_name}"
		end
	end

	def show_hands
		puts ""
		puts " #{@user_name}: #{@hands[@user_hand-1]}"
		puts " #{@cpu_name}: #{@hands[@cpu_hand-1]}"
	end
end

#hell
Janken.new

