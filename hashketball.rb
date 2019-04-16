# Write your code here!
require "pry" 
def game_hash
  hash = {
  :home => {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },
  :away => {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
        }
      }
    }
  }
  hash
end

def home_team_name
  game_hash[:home][:team_name]
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          if players == player
            stats.each do |k, v|
              if k == :points
                return v
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          if players == player
            stats.each do |k, v|
              if k == :shoe
                return v
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  result = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        result << data
      end
    end
  end
  result
end

def player_numbers(team)
  result = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |players, stats|
           stats.each do |k, v|
              if k == :number
                result << v
              end
            end
          end
        end
      end
    end
  end
  result
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          if players == player
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  temp_shoe = 0
  temp_boards = 0
  flag = false
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          stats.each do |k, v|
            if k == :shoe
              if temp_shoe < v
                temp_shoe = v
                flag = true
              end
            end
              
            if k == :rebounds && flag == true
              temp_boards = v
            end
          end
        end
      end
    end
  end
  temp_boards
end

def most_points_scored
  temp_points = 0
  temp_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          stats.each do |k, v|
            if k == :points
              if temp_points < v
                temp_points = v
                temp_name = players
              end
            end
          end
        end
      end
    end
  end
  temp_name
end

def winning_team
  total_home = 0
  total_away = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          stats.each do |k, v|
            if k == :points
              if location == :home
                total_home += v
              else
                total_away += v
              end
            end
          end
        end
      end
    end
  end
  
  if total_home > total_away
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  length = 0
  temp_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, stats|
          if length < players.length
            length = players.length
            temp_name = players
          end
        end
      end
    end
  end
  temp_name
end

def long_name_steals_a_ton?
  
end