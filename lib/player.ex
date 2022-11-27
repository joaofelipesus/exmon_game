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

  def new_player(:bot) do
    %__MODULE__{
      name: "Leon S. Kennedy",
      default_attack_name: "Handgun shot",
      special_attack_name: "Shotgun shot",
      cure_power_name: "Green herb"
    }
  end

  def new_player(:human, io \\ IO) do
    name = String.trim(io.gets("Name: "))
    default_attack_name = String.trim(io.gets("Default attack: "))
    special_attack_name = String.trim(io.gets("Special attack: "))
    cure_power_name = String.trim(io.gets("Cure power: "))
    %__MODULE__{
      name: name,
      default_attack_name: default_attack_name,
      special_attack_name: special_attack_name,
      cure_power_name: cure_power_name
    }
  end
end
