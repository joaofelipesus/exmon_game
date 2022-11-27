defmodule Player do
  defstruct name: nil,
            default_attack_name: nil,
            special_attack_name: nil,
            cure_power_name: nil,
            life_points: 100

  def default_attack do
    Enum.random(18..25)
  end

  def special_attack do
    Enum.random(10..35)
  end

  def cure_power do
    Enum.random(18..25)
  end

  def update_life_points(player, value, :decrease) do
    new_life_points = player.life_points - value

    cond do
      new_life_points < 0 -> {:ok, %{player | life_points: 0}}
      new_life_points >= 0 -> {:ok, %{player | life_points: new_life_points}}
    end
  end

  def update_life_points(player, value, :increase) do
    player = %{player | life_points: player.life_points + value}

    {:ok, player}
  end
end
