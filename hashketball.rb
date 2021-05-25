require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player)
  result = 0
  game_hash.each do |key, value|
    value[:players].each do |array_index|
      if array_index[:player_name] == player
        result = array_index[:points]
      end
    end
  end
  result
end

def shoe_size(player)
  result = 0
  game_hash.each do |key, value|
    value[:players].each do |array_index|
      if array_index[:player_name] == player
        result = array_index[:show]
      end
    end
  end
  result[:shoe]
end

def team_colors(team)
  result = game_hash.find do |key, value|
    value[:team_name] == team
  end
  result[1][:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  game_hash.each_with_object([]) do |(key, value), final_array|
    if value[:team_name] == team
      value[:players].each do |hash|
        final_array << hash[:number]
      end
    end
  end
end

def player_stats(player)
  final_hash = {}
  game_hash.each do |key, value|
    value[:players].each do |player_hash|
      if player_hash[:player_name] == player
        final_hash = player_hash
      end
    end
  end
  final_hash
end

def big_shoe_rebounds
  all_players_rebounds = game_hash.each_with_object([]) do |(key, value), players_array|
    value[:players].each do |player_hash|
      players_array << [player_hash[:player_name], player_hash[:rebounds]]
    end
  end
  
  all_shoes = game_hash.each_with_object([]) do |(key, value), shoes_array|
    value[:players].each do |player_hash|
     shoes_array << player_hash[:shoe]
    end
  end
  max_size_index = all_shoes.index(all_shoes.max)
  all_players_rebounds[max_size_index][1]
end