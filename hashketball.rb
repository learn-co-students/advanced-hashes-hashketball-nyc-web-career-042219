require "pry"

def game_hash
  hash = {
    home: {
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
    away: {
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
          steals:22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.map do |location, team_data|
    # puts "#{location} and #{team_data}"
    # puts "----------------------------"
    team_data.map do |attribute, data|
      # puts "#{attribute} and #{data}"
      # puts "------------------------"
      if attribute == :players
        data.map do |player, stats|
          # puts "#{player} and #{stats}"
          # puts "-----------------------"
          if player == player_name
            stats.map do |stat, value|
              # puts "#{stat}: #{value}"
              # puts "-----------------"
              return value if stat == :points
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          if player == player_name
            stats.map do |stat, value|
              return value if stat == :shoe
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      # puts "#{attribute}: #{data}"
      # puts "---------------------"
      if attribute == :team_name && data == team_name
        attribute = :colors 
        return game_hash[location][attribute]
      end
    end
  end
end

def team_names
  teams = []
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      teams << game_hash[location][attribute] if attribute == :team_name
    end
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team_name
        attribute = :players 
        data = game_hash[location][attribute]
        data.each do |player, stats|
          stats.each do |stat, value|
            numbers << value if stat == :number
          end 
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          return stats if player == player_name
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0
  person_with_largest_shoe = ""
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each_key do |player|
          # stats.each do |stat, value|
          #   person_with_largest_shoe = player if shoe_size(player) > largest_shoe
          # end
          # return game_hash[location][attribute][player]
          if shoe_size(player) > largest_shoe
            person_with_largest_shoe = player 
            largest_shoe = shoe_size(player)
            rebounds = game_hash[location][attribute][player][:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  person_with_most_points = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each_key do |player|
          if num_points_scored(player) > points
            person_with_most_points = player
            points = num_points_scored(player)
          end
        end
      end
    end
  end
  person_with_most_points
end

def winning_team
  team_one_points = 0
  team_two_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, value|
            if stat == :points && location == :home
              team_one_points += value
            elsif stat == :points && location == :away
              team_two_points += value
            end
          end
        end
      end
    end
  end
  team_one_points > team_two_points ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each_key do |name|
          longest_name = name if name.length > longest_name.length
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  steals = 0
  player_with_most_steals = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, value|
            steals = value if stat == :steals && value > steals
            player_with_most_steals = player
          end
        end
      end
    end
  end
  player_with_most_steals == player_with_longest_name
end