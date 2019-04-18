# Write your code here!
require 'pry'
def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
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

      ]

    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
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

      ]


    }
  }
end

def num_points_scored (player)
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

        if attribute == :players

          data.each do |data_item|
            data_item.each do |player_stats, stats|

            if player_stats == player
              stats.each do |stat_name, stat_data|
                if stat_name == :points
                  return stat_data

                end
              end
            end
            end
          end
        end
      end
    end
end

def shoe_size (player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            data_item.each do |player_stats, stats|

            if player_stats == player
              stats.each do |stat_name, stat_data|
                if stat_name == :shoe
                  return stat_data
                end
              end
            end
            end
          end
        end
      end
    end
end

def team_colors (team_name)
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

        if data == team_name

          return game_hash[location][:colors]
        end
      end
    end
end

def team_names
  arr_teams = []
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

        if attribute == :team_name
            arr_teams << data

        end
      end
    end
    arr_teams
end

def player_numbers (team_name)
  arr_num = []
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
          if data == team_name

            game_hash[location][:players].each do |player|
              player.each do |player_name, stats|
                stats.each do |stat_name, stastic|
                  if stat_name == :number
                    arr_num << stastic
                  end
                end
              end
            end

          end
      end
    end
    arr_num
end

def player_stats (name)
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
            game_hash[location][:players].each do |player|
              player.each do |player_name, stats|
                if player_name == name
                  return stats

                end
              end
            end

          end
      end
end

def big_shoe_rebounds
  max_shoe = 0
  flag = 0
  max_play_name = ""
  max_rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
          data.each do |data_item|
            data_item.each do |player_stats, stats|
              stats.each do |stat_name, stat_data|
                if stat_name == :shoe
                  if stat_data > max_shoe
                    max_shoe = stat_data
                    flag = 1
                  end
                end
                if stat_name == :rebounds && flag == 1
                  return stat_data
                end
              end
            end
          end
        end
      end
    end
end
