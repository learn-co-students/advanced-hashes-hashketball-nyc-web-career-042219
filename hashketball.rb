require "pry"

def game_hash
  { :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0, 
        :shoe => 16, 
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 1,
      },
      "Reggie Evans" => {
        :number => 30, 
        :shoe => 14, 
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12, 
        :blocks => 12,
        :slam_dunks => 7,
      },
      "Brook Lopez" => {
        :number => 11, 
        :shoe => 17, 
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 15,
      },
      "Mason Plumlee" => {
        :number => 1, 
        :shoe => 19, 
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3, 
        :blocks => 8,
        :slam_dunks => 5,
      },
      "Jason Terry" => {
        :number => 31, 
        :shoe => 15, 
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4, 
        :blocks => 11,
        :slam_dunks => 1,
      },
      },
      },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4, 
        :shoe => 18, 
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2, 
        :blocks => 7,
        :slam_dunks => 2,
      },
      "Bismak Biyombo" => {
        :number => 0, 
        :shoe => 16, 
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7, 
        :blocks => 15,
        :slam_dunks => 10,
      },
      "DeSagna Diop" => {
        :number => 2, 
        :shoe => 14, 
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4, 
        :blocks => 5,
        :slam_dunks => 5,
      },
      "Ben Gordon" => {
        :number => 8, 
        :shoe => 15, 
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1, 
        :blocks => 1,
        :slam_dunks => 0,
      },
      "Brendan Haywood" => {
        :number => 33, 
        :shoe => 15, 
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22, 
        :blocks => 5,
        :slam_dunks => 12,
      }
     }
    }
   }
end

def num_points_scored(player)
  points_scored = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |key, value|
          if key == player 
            points_scored = value[:points]  
          end 
        end
      end
    end
  end
  points_scored
end

def shoe_size(player)
  shoe_size = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |key, value|
          if key == player 
            shoe_size = value[:shoe]  
          end 
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  team_colors = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_colors = team_data[:colors]
      end
    end
  end
  team_colors
end

def team_names
  array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        array.push(team_data[:team_name])
      end
    end
  end
  array
end

def player_numbers(team_name)
  array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_data.each do |attribute, data|
          if attribute == :players 
            data.each do |player, stat|
              stat.each do |stat, value|
                if stat == :number
                  array.push(value)
                end
              end
            end
          end
        end
      end
    end
  end
  array
end
        
def player_stats(player_name)
  stats = ''
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data|
          if player == player_name
            stats = data
          end
        end
      end
    end
  end
  stats
end
 
def big_shoe_rebounds
  array = []
  array_shoe = []
  array_players = []
  shoe_hash = {} 
  game_hash.each do |location, attribute|
    attribute.each do |team_data, stats|
      if team_data == :players 
        stats.each do |player, stat|
           stat.each do |stat, value|
              if stat == :shoe
                array.push(player, value)
                 
              end
            end
        end
      end
    end
  end
  array.each do |value|
    value.is_a?(String) ? array_players.push(value) : array_shoe.push(value)
  end
  shoe_hash = array_players.map(&:to_sym).zip(array_shoe).to_h
  shoe_hash.key(shoe_hash.values.max)
  
  rebounds = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |key, value|
          if key == shoe_hash.key(shoe_hash.values.max).to_s 
            rebounds = value[:rebounds]  
          end 
        end
      end
    end
  end
  rebounds
  
end
          
          

#  i = 0 
#  until array_rebounds.length > i  
#    rebounds_hash[array_players[i]] = "#{array_rebounds[i]}" 
#    i += 1 
#  end
#  rebounds_hash        
 
 










