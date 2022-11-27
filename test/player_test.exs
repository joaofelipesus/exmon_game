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

  describe "default_attack" do
    test "it returns a number between min and max default attack value" do
      attack_value = Player.default_attack()
      assert attack_value >= 18
      assert attack_value <= 25
    end
  end

  describe "special_attack" do
    test "it returns a number between min and max default attack value" do
      attack_value = Player.special_attack()
      assert attack_value >= 10
      assert attack_value <= 35
    end
  end

  describe "cure_power" do
    test "it returns a number between min and max default attack value" do
      attack_value = Player.cure_power()
      assert attack_value >= 18
      assert attack_value <= 25
    end
  end
end
