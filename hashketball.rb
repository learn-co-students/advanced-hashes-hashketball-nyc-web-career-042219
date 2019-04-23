# Write your code here!
require "pry"

def game_hash
	game = {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors =>["Black", "White"],
			:players => {
				"Alan Anderson" => {
			        :number => 0,
    			    :shoe => 16,
        			:points => 22,
        			:rebounds => 12,
        			:assists => 12,
        			:steals => 3,
        			:blocks => 1,
        			:slam_dunks => 1
				},
				"Reggie Evans" => {
			        :number => 30,
			        :shoe => 14,
        			:points => 12,
        			:rebounds => 12,
        			:assists => 12,
        			:steals => 12,
        			:blocks => 12,
        			:slam_dunks => 7
				},
				"Brook Lopez" => {
					:number => 11,
        			:shoe => 17,
        			:points => 17,
        			:rebounds => 19,
        			:assists => 10,
        			:steals => 3,
        			:blocks => 1,
        			:slam_dunks => 15
				},
				"Mason Plumlee" => {
					:number => 1,
        			:shoe => 19,
        			:points => 26,
        			:rebounds => 12,
        			:assists => 6,
        			:steals => 3,
        			:blocks => 8,
        			:slam_dunks => 5
				},
				"Jason Terry" => {
					:number => 31,
        			:shoe => 15,
        			:points => 19,
        			:rebounds => 2,
        			:assists => 2,
        			:steals => 4,
        			:blocks => 11,
        			:slam_dunks => 1
				}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors =>["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {
        			:number => 4,
        			:shoe => 18,
        			:points => 10,
        			:rebounds => 1,
        			:assists => 1,
        			:steals => 2,
        			:blocks => 7,
        			:slam_dunks => 2
				},
				"Bismak Biyombo" => {
					:number => 0,
        			:shoe => 16,
        			:points => 12,
        			:rebounds => 4,
        			:assists => 7,
        			:steals => 7,
        			:blocks => 15,
       			 	:slam_dunks => 10
				},
				"DeSagna Diop" => {
			        :number => 2,
        			:shoe => 14,
      			  	:points => 24,
        			:rebounds => 12,
       			 	:assists => 12,
        			:steals => 4,
        			:blocks => 5,
        			:slam_dunks => 5
				},
				"Ben Gordon" => {
        			:number => 8,
        			:shoe => 15,
        			:points => 33,
        			:rebounds => 3,
        			:assists => 2,
        			:steals => 1,
        			:blocks => 1,
        			:slam_dunks => 0
				},
				"Brendan Haywood" => {
			        :number => 33,
        			:shoe => 15,
        			:points => 6,
        			:rebounds => 12,
        			:assists => 12,
        			:steals => 22,
        			:blocks => 5,
        			:slam_dunks => 12
				}
			}
		}
	}
	game
end


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
 
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end

# good_practices

def num_points_scored(player_name)
	p = nil
	if game_hash[:home][:players].keys.include?(player_name) 
		p = game_hash[:home][:players][player_name][:points]
	elsif game_hash[:away][:players].keys.include?(player_name)
		p = game_hash[:away][:players][player_name][:points]
	end
	p 
end

def shoe_size(player_name)
	p = nil
	if game_hash[:home][:players].keys.include?(player_name) 
		p = game_hash[:home][:players][player_name][:shoe]
	elsif game_hash[:away][:players].keys.include?(player_name)
		p = game_hash[:away][:players][player_name][:shoe]
	end
	p 
end

def team_colors(t)
	p = nil
	if game_hash[:home][:team_name] == t
		p = game_hash[:home][:colors]
	elsif game_hash[:away][:team_name] == t
		p = game_hash[:away][:colors]
	end
	p 
end

def team_names
	arr = []
	arr.push(game_hash[:home][:team_name], game_hash[:away][:team_name])
	arr
end

def player_numbers(t)
	arr = []
	if game_hash[:home][:team_name] == t
		game_hash[:home][:players].each do |player_name, stats|
			arr.push(stats[:number])
		end
	elsif game_hash[:away][:team_name] == t
		game_hash[:away][:players].each do |player_name, stats|
			arr.push(stats[:number])
		end
	end
	arr
end

def player_stats(player_name)
	p = nil
	if game_hash[:home][:players].keys.include?(player_name) 
		p = game_hash[:home][:players][player_name]
	elsif game_hash[:away][:players].keys.include?(player_name)
		p = game_hash[:away][:players][player_name]
	end
	p 
end

def big_shoe_rebounds
	max_player = nil
	max_shoe = nil
	# arr.push(game_hash[:home][:players], game_hash[:away][:players])
	r = nil
	game_hash[:home][:players].each do |player_name, stats|
		if !max_shoe or stats[:shoe] > max_shoe
			max_player = player_name
			max_shoe = stats[:shoe]
		end
	end
	game_hash[:away][:players].each do |player_name, stats|
		if !max_shoe or stats[:shoe] > max_shoe
			max_player = player_name
			max_shoe = stats[:shoe]
		end
	end
	if game_hash[:home][:players].include?(max_player)
		r = game_hash[:home][:players][max_player][:rebounds]
	else
		r = game_hash[:away][:players][max_player][:rebounds]
	end
	r 
end

def most_points_scored
	most_points = nil
	player = nil
	game_hash.each do |team, attributes|
		game_hash[team][:players].each do |player_name, player_info|
			if !most_points || player_info[:points] > most_points
				player = player_name
				most_points = player_info[:points]
			end
		end
	end
	player
end

def winning_team
	home_count = 0
	away_count = 0
	game_hash[:home][:players].each do |player_name, stats|
		# binding.pry
		home_count += stats[:points]
	end 
	game_hash[:away][:players].each do |player_name, stats|
		away_count += stats[:points]
	end 
	home_count > away_count ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
	name_length = nil
	player = ""
	game_hash.each do |team, info|
		game_hash[team][:players].each do |player_name, attr|
			if !name_length || player_name.length > name_length
				name_length = player_name.length
				player = player_name
			end
		end
	end
	player
end

def long_name_steals_a_ton?
	most_steals = nil
	player = ""
	game_hash.each do |team, info|
		game_hash[team][:players].each do |player_name, attribute|
			# binding.pry
			if !most_steals || attribute[:steals] > most_steals
				most_steals = attribute[:steals]
				player = player_name
			end
		end
	end
	# binding.pry
	player == player_with_longest_name ? true : false
end




