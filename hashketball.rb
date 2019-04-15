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
        },
      },
    },
  }
end

def num_points_scored(name)
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == name
            value3.each do |key4, value4|
              if key4 == :points
                return value4
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == name
            value3.each do |key4, value4|
              if key4 == :shoe
                return value4
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if value2 == name
        value1.each do |key2, value2|
          if key2 == :colors
            return value2
          end
        end
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :team_name
        names.push(value2)
      end
    end
  end
  names
end

def player_numbers(name)
  numbers = []
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if value2 == name
        value1.each do |key2, value2|
          if key2 == :players
            value2.each do |key3, value3|
              value3.each do |key4, value4|
                if key4 == :number
                  numbers.push(value4)
                end
              end
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == name
            return value3
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  sizes = []
  big_feet = " "
  largest_shoe = 1
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          value3.each do |key4, value4|
            if key4 == :shoe
              sizes.push(value4)
            end
          end
        end
      end
    end
  end
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          value3.each do |key4, value4|
            if key4 == :shoe
              if value4 == sizes.max
                big_feet = key3
              end
            end
          end
        end
      end
    end
  end
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == big_feet
            value3.each do |key4, value4|
              if key4 == :rebounds
                return value4
              end
            end
          end
        end
      end
    end
  end
end

def most_points_scored
  points = []
  high_score = " "
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          value3.each do |key4, value4|
            if key4 == :points
              points.push(value4)
            end
          end
        end
      end
    end
  end
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          value3.each do |key4, value4|
            if key4 == :points
              if value4 == points.max
                high_score = key3
              end
            end
          end
        end
      end
    end
  end
  high_score
end

def winning_team
  home_points = []
  away_points = []
  high_score = " "
  game_hash.each do |key1, value1|
    if key1 == :home
      value1.each do |key2, value2|
        if key2 == :players
          value2.each do |key3, value3|
            value3.each do |key4, value4|
              if key4 == :points
                home_points.push(value4)
              end
            end
          end
        end
      end
    end
  end
  game_hash.each do |key1, value1|
    if key1 == :away
      value1.each do |key2, value2|
        if key2 == :players
          value2.each do |key3, value3|
            value3.each do |key4, value4|
              if key4 == :points
                away_points.push(value4)
              end
            end
          end
        end
      end
    end
  end
  if home_points.sum > away_points.sum
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_lengths = []
  longest_name = " "
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          name_lengths.push(key3.length)
        end
      end
    end
  end
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3.length == name_lengths.max
            longest_name = key3
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  name_lengths = []
  longest_name = " "
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          name_lengths.push(key3.length)
        end
      end
    end
  end
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3.length == name_lengths.max
            longest_name = key3
          end
        end
      end
    end
  end

  steals = []
  high_score = " "
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          value3.each do |key4, value4|
            if key4 == :steals
              steals.push(value4)
            end
          end
        end
      end
    end
  end
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          value3.each do |key4, value4|
            if key4 == :steals
              if value4 == steals.max
                high_score = key3
              end
            end
          end
        end
      end
    end
  end

  if high_score == longest_name
    return true
  end
end
