require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team).to be_a Team
  end

  it 'has a name' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.name).to eq("Dodgers")
  end

  it 'has a location' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.location).to eq("Los Angeles")
  end

  it 'has a roster' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.roster).to eq([])
  # expect(team.roster).to be_empty
  end

  it "has a number of players" do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.player_count).to eq(0)
  # expect(team.player_count).to be_zero
  end

  it "add a player to the roster" do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    player_2 = Player.new("Kenny DeNunez", 500000, 24)

    team.add_player(player_1)
    team.add_player(player_2)

    expect(team.roster).to eq([player_1, player_2])
    expect(team.player_count).to eq(2)
  end

  it "has long_term players" do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    player_2 = Player.new("Kenny DeNunez", 500000, 24)
    player_3 = Player.new("Alan McClennan", 750000, 48)
    player_4 = Player.new("Hamilton Porter", 100000, 12)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.long_term_players).to eq([player_1, player_3])
  end

  it "has short_term players" do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    player_2 = Player.new("Kenny DeNunez", 500000, 24)
    player_3 = Player.new("Alan McClennan", 750000, 48)
    player_4 = Player.new("Hamilton Porter", 100000, 12)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.short_term_players).to eq([player_4, player_2])
  end
end