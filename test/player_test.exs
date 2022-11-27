defmodule PlayerTest do
  use ExUnit.Case

  test "player stuct" do
    player = %Player{
      name: "José Aldo Jr.",
      default_attack_name: "jeb",
      special_attack_name: "low kick",
      cure_power_name: "Dedé speach"
    }

    assert player.name == "José Aldo Jr."
    assert player.default_attack_name == "jeb"
    assert player.special_attack_name == "low kick"
    assert player.cure_power_name == "Dedé speach"
    assert player.life_points == 100
  end
end
