defmodule Player do
  defstruct name: nil,
            default_attack_name: nil,
            special_attack_name: nil,
            cure_power_name: nil,
            life_points: 100

  def default_attack do
    Enum.random(18..25)
  end
end
