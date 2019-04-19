def game_hash
  g_hash = {
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

g_hash

end

def num_points_scored(player)
  puntos = 5
  game_hash.each do |location, data|
    data.each do |attribute, info|
      if attribute == :players
        info.each do |name, stats|
          if name == player
            stats.each do |category, number|
              if category == :points
                puntos = number
              end
            end
          end
        end
      end
    end
  end
  puntos
end

def shoe_size(player)
  size = 5
  game_hash.each do |location, data|
    data.each do |attribute, info|
      if attribute == :players
        info.each do |name, stats|
          if name == player
            stats.each do |category, number|
              if category == :shoe
                size = number
              end
            end
          end
        end
      end
    end
  end
  size
end

def player_numbers(name)

  numbers_arr = []

  if game_hash[:home][:team_name] == name
    game_hash[:home][:players].each do |name, stats|
      stats.each do |category, number|
        if category == :number
          numbers_arr << number
        end
      end
    end
  end

  if game_hash[:away][:team_name] == name
    game_hash[:away][:players].each do |name, stats|
      stats.each do |category, number|
        if category == :number
          numbers_arr << number
        end
      end
    end
  end

  numbers_arr

end


def team_names()

  name_arr = []

  name_arr << game_hash[:home][:team_name]
  name_arr << game_hash[:away][:team_name]

  name_arr

end

def player_stats(player_name)

  stats_hash = {}

  game_hash.each do |location, data|
    data.each do |attribute, info|
      if attribute == :players
        info.each do |name, stats|
          if name == player_name
            stats_hash = stats
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds

  biggest = 0
  big_shoe_name = ''
  rebounds = 0

  game_hash.each do |location, data|
    data.each do |attribute, info|
      if attribute == :players
        info.each do |name, stats|
          stats.each do |category, number|
            if category == :shoe && number > biggest
              big_shoe_name = name
            end
          end
        end
      end
    end
  end

  game_hash.each do |location, data|
    data.each do |attribute, info|
      if attribute == :players
        info.each do |name, stats|
          if name == big_shoe_name
            stats.each do |category, number|
              if category == :rebounds
                rebounds = number
              end
            end
          end
        end
      end
    end
  end
  rebounds

end

def team_colors(name)

  color_arr = []

  if game_hash[:home][:team_name] ==  name
    color_arr = game_hash[:home][:colors]
  else if game_hash[:away][:team_name] == name
    color_arr = game_hash[:away][:colors]
  end
  color_arr

end


end
