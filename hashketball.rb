require "pry"

def game_hash
  {
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
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player)
  points = 0
  game_hash.each do |game_key, game_value|
    game_value.each do |team_key, team_value|
      if team_key == :players #not sure why this doesnt work with points:
        team_value.each do |player_key, player_value|
          if player_key == player
          points = player_value[:points] #not sure why this doesnt work with points:
          end
        end
      end
    end
  end
  return points
end

def shoe_size(player)
  shoe = 0
  game_hash.each do |game_key, game_value|
    game_value.each do |team_key, team_value|
      if team_key == :players
        team_value.each do |player_key, player_value|
          if player_key == player
          shoe = player_value[:shoe]
          end
        end
      end
    end
  end
  return shoe
end

# def player_numbers(team)
#   number = []
#   game_hash.each do |game_key, game_value|
#     if game_value[:team_name] == team
#     game_value.each do |team_key, team_value|
#     if team_key == :players
#     team_value.each do |player_key, player_value|
#       # binding.pry
#     number << player_key[:number].to_s
#           end
#         end
#       end
#     end
#   # binding.pry
# end
# return numbers.join(", ")
# end

#
#
def team_colors(team)
  color = []
  game_hash.each do |game_key, game_value|
    game_value.each do |team_key, team_value|
      if team_value == team
        binding.pry
        color << team_key[:colors]
      end
    end
  end
  return color.to_s
end

#
#
# def big_shoe_rebounds
#   biggest_size = 0
#   game_hash.each do |game_key, game_value|
#   game_value.each do |team_key, team_value|
#   if team_key == :players
#   team_value.each do |player_key, player_value|
#   # binding.pry
#   if player_value[:shoe] > biggest_size
#     biggest_size = player_value[:shoe]
#         end
#       end
#     end
#   end
# end
# return player_value[:rebounds]
# end
