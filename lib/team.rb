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
    @roster.select {|player| player.contract_length > 24}
  end

  def short_term_players
    player = @roster.reject do |player|
      if player.contract_length> 24
        player
      end
      players.sort_by do |player|
        player.contract_length
      end
    end
  end

  def total_value
    @roster.sum do |player|
      player.monthly_cost * player.contract_length
    # player.total_cost
    end
  end

  def details
    {
      "total_value" => total_value
      "player_count" => player_count
    }
  end

  # def average_cost_of_player
  #   @average_cost_of_player == total_value / player_count
  #   # gets the charater length of the cost (1000 => 4)
  #   characters - @average_cost_of_player.to_s.length

  #   to currency (@average_cost_of_player.to_s, characters)
  # end

  # def to_currency(string, characters)
  #   commas_to_add = characters / 3 - 1
  #   commas_added = 0

  #   if commas_added != commas_to_add  
  #     # 4 index positions from the last position, add a comma
  #     # ex: 100 => 1,000
  #     @string = string.insert(-4, ",")
  #     until commas_added = commas_to_add
  #       commas_index = @string.index(",")
  #       @string = @string.insert(commas_index -3, ",")
  #       commas_added += 1
  #     end
  #   end
  #    @string.prepend("$")
  
  def average_cost_of_player
    average_cost = (total_value / player_count).digits
    cost = ""

    average_cost.each.with_index do |digit, index|
      cost = digit.to_s + cost

      if (index % 3 == 2)
        cost = "," + cost
      end
    end

    "$#{cost}"
    end

    def players_by_last_name
      roster.map { |player| player.last_name}.sort.join(", ")
    end
  end
end