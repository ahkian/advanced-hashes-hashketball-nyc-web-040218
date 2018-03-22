require 'pry'
# Write your code here!
def game_hash
   {
  home: {
    team_name: "Brooklyn Nets",
    colors:["Black", "White"],
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
        number:  4,
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
  answer = ""
  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |category, stats|
      # binding.pry
      if category == :players
        stats.each do |name, values|
          # binding.pry

            stats.each do |attribute, statistics|
              # binding.pry
              if player == attribute
                statistics.each do |type, amount|
                  # binding.pry
                  if type == :points
                    # binding.pry
                    answer = amount
                    return answer
                  end
                end
              end
            end
        end
      end
    end
  end
end

def shoe_size(player)
  answer = ""
  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |category, stats|
      # binding.pry
      if category == :players
        stats.each do |name, values|
          # binding.pry

            stats.each do |attribute, statistics|
              # binding.pry
              if player == attribute
                statistics.each do |type, amount|
                  # binding.pry
                  if type == :shoe
                    # binding.pry
                    answer = amount
                    return answer
                  end
                end
              end
            end
        end
      end
    end
  end
end

def team_colors(team)
  answer = ""
  game_hash.each do |location, data|
    data.each do |category, datum|
      if datum == team
        data.each do |category, datum|
          if category == :colors
            answer = datum
            return answer
          end
        end
      end
    end
  end
end

def team_names
  answer = []
  game_hash.each do |location, team_data|
    team_data.each do |category, data|
      if category == :team_name
        answer << data
      end
    end
  end
  return answer
end

def player_numbers(team)
  answer = []
  game_hash.each do |location, team_data|
    team_data.each do |category, data|
      if category == :team_name && data == team
        team_data.each do |category, data|
          if category == :players
            data.each do |player_name, stats|
              stats.each do |type, numbers|
                if type == :number
                  answer << numbers
                end
              end
            end
          end
        end
      end
    end
  end
  answer
end

def player_stats(player)
  stats = []
  game_hash.each do |location, team_data|
    team_data.each do |category, data|
      if category == :players
        data.each do |player_name, statistics|
          if player_name == player
            stats = statistics
            return statistics
          end
        end
      end
    end
  end
end

def biggest_shoe
  shoe_sizes = Hash.new
  game_hash.each do |location, team_data|
    team_data.each do |category, data|
      if category == :players
        data.each do |player_name, statistics|
          temp_var = player_name
          statistics.each do |type, amount|
            if type == :shoe
              shoe_sizes[temp_var] = amount
            end
          end
        end
      end
    end
  end
  shoe_sizes = shoe_sizes.sort_by{|k, v| v}.reverse.to_h
  return shoe_sizes.first[0]
end

def big_shoe_rebounds
  big_foot = biggest_shoe
  game_hash.each do |location, team_data|
    team_data.each do |category, data|
      if category == :players
        data.each do |player_name, statistics|
          if player_name == big_foot
            statistics.each do |type, amount|
              if type == :rebounds
                return amount
              end
            end
          end
        end
      end
    end
  end
end
