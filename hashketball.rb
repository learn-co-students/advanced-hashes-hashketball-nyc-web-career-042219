require "pry"

def game_hash
  game_hash = {
    :home => {
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
        }
      }
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

def num_points_scored(name)
  points_array = []

  game_hash.each do |location, info|
    info.each do |attribute, values|
      if attribute == :players
        values.each do |player, data|
          data.each do |sub_key, point_total|
            if player == name && sub_key == :points
              points_array << point_total
            end

          end
        end
      end
    end
  end
    return points_array[0]
end

def shoe_size(name)
  shoe_array = []

  game_hash.each do |location, info|
    info.each do |attribute, values|
      if attribute == :players
        values.each do |player, data|
          data.each do |sub_key, shoe_info|
            if player == name && sub_key == :shoe
              shoe_array << shoe_info
            end

          end
        end
      end
    end
  end
    return shoe_array[0]
end

def team_colors(team)
  if team == "Brooklyn Nets"
    game_hash[:home][:colors]
  elsif team == "Charlotte Hornets"
    game_hash[:away][:colors]
  end
end

def team_names
  team_array = []
  game_hash.each do |location, info|
    info.each do |attribute, values|
      if attribute == :team_name
        team_array << values
      end
    end
  end
  return team_array
end

def player_numbers(team)
  jersey_array = []

  game_hash.each do |location, info|
    if game_hash[location][:team_name] == team
    info.each do |attribute, values|
      if attribute == :players
        values.each do |player, data|
          data.each do |sub_key, jersey_info|
            if sub_key == :number
              jersey_array << jersey_info
            end
          end
          end
        end
      end
    end
  end
  return jersey_array
end

def player_stats(player_name)
  p_stats = []

  game_hash.each do |location, info|
    info.each do |attribute, values|
      if attribute == :players
        values.each do |name, stats|
          if name == player_name
            p_stats << stats
          end
        end
      end
    end
  end
  return p_stats[0]
end

def big_shoe_rebounds
  max_rebounds = nil
  numbers = []
  big_shoes = nil

    game_hash.collect do |location, info|
      info[:players].collect do |attribute, values|
        numbers << values[:shoe]
        big_shoes = numbers.sort[-1]
        values.collect do |category, stats|
          if category == :shoe
            if stats == big_shoes
              max_rebounds = values[:rebounds]
            end
          end
        end
      end
    end
    return max_rebounds
  end
