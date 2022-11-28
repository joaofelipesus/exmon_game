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

  def update_life_points(player, value, :default_attack) do
    decrease_life_points(player, value)
  end

  def update_life_points(player, value, :special_attack) do
    decrease_life_points(player, value)
  end

  def update_life_points(player, value, :cure_power) do
    player = %{player | life_points: player.life_points + value}

    {:ok, player}
  end

  defp decrease_life_points(player, value) do
    new_life_points = player.life_points - value

    cond do
      new_life_points < 0 -> {:ok, %{player | life_points: 0}}
      new_life_points >= 0 -> {:ok, %{player | life_points: new_life_points}}
    end
  end

  def new_player(:bot) do
    %__MODULE__{
      name: "Nemesis",
      default_attack_name: "Punch",
      special_attack_name: "Rocket launcher",
      cure_power_name: "Regenerate"
    }
  end

  def new_player(:human) do
    %__MODULE__{
      name: "Leon S. Kennedy",
      default_attack_name: "Handgun shot",
      special_attack_name: "Shotgun shot",
      cure_power_name: "Green herb"
    }
  end
end
