class Player 
  attr_reader :first_name,
              :last_name,
              :monthly_cost,
              :contract_length
  
  attr_accessor :nickname

  def initialize(full_name, monthly_cost, contract_length)
    @first_name, @last_name = full_name.split(" ")
    @monthly_cost = monthly_cost
    @contract_length = contract_length
    @nickname = nil
  end

  def total_cost
    @monthly_cost * @contract_length
  end

  def set_nickname!(player_nickname)
      @nickname = player_nickname
  end
end