  	#!/usr/bin/env ruby

     	# Twitter bot to generate descriptions of cliched games on Steam
     	# Greenlight and tweet those descriptions
     
    	require 'Twitter'
       
  	Twitter.configure do |config|
    		config.consumer_key = YOUR_CONSUMER_KEY
    		config.consumer_secret = YOUR_CONSUMER_SECRET
    		config.oauth_token = YOUR_OAUTH_TOKEN
    		config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
	end

	business_model = "crowd-funded"
	game_cliche1 = "survival"
	game_cliche2 = "zombie"
	game_genre = "FPS"
	

	#This gets a game cliche from a list of cliches in a text file
	def get_game_cliche
		#initialize variable
		chosen_line = nil
		
		#Get the cliche
		File.foreach("game_cliches.txt").each_with_index do |line, number|
			chosen_line = line if rand < 1.0/(number+1)
		end
				
	return chosen_line.chomp
	end
	
		#This gets a business model from a list in a text file
	def get_business_model
		#initialize variable
		chosen_line = nil
		
		#Get the cliche
		File.foreach("business_models.txt").each_with_index do |line, number|
			chosen_line = line if rand < 1.0/(number+1)
		end
		
	return chosen_line.chomp
	end
	
		#This gets a game genre from a list in a text file
	def get_game_genre
		#initialize variable
		chosen_line = nil
		
		#Get the cliche
		File.foreach("game_genres.txt").each_with_index do |line, number|
			chosen_line = line if rand < 1.0/(number+1)
		end
		

	return chosen_line.chomp
	end
	
	#Get the cliches
	game_cliche1 = get_game_cliche
	game_cliche2 = get_game_cliche
	
	#Make sure they're different!
	while game_cliche1 == game_cliche2 do
		game_cliche2 = get_game_cliche
	end
	
	#Get business model and genre
	business_model = get_business_model
	game_genre = get_game_genre
	
  #Compose the tweet
	composed_tweet = "Vote for our #{business_model} #{game_cliche1} #{game_cliche2} #{game_genre} on Steam Greenlight!"
	
	#Output to console for testing
	puts composed_tweet
	
	#Output to Twitter
	Twitter.update(composed_tweet)