class Team
  attr_reader :name,
              :location,
              :roster

  def initialize(name, location)
    @name = name
    @location = location
    @roster = []
  end

  def player_count
    @roster.length
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    @roster.select { |player| player.contract_length > 24 }
  end
end