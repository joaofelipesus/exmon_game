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

  describe "default_attack/0" do
    test "it returns a number between min and max default attack value" do
      attack_value = Player.default_attack()
      assert attack_value >= 18
      assert attack_value <= 25
    end
  end

  describe "special_attack/0" do
    test "it returns a number between min and max default attack value" do
      attack_value = Player.special_attack()
      assert attack_value >= 10
      assert attack_value <= 35
    end
  end

  describe "cure_power/0" do
    test "it returns a number between min and max default attack value" do
      attack_value = Player.cure_power()
      assert attack_value >= 18
      assert attack_value <= 25
    end
  end

  describe "update_life_points(player, value, :cure_power)" do
    test "it returns a player with increased life_points when receive increase" do
      player = %Player{
        name: "José Aldo Jr.",
        default_attack_name: "jeb",
        special_attack_name: "low kick",
        cure_power_name: "Dedé speach"
      }

      {:ok, player} = Player.update_life_points(player, 15, :cure_power)
      assert player.life_points == 115
    end
  end

  describe "update_life_points(player, value, :default_attack)" do
    test "it returns a player with decreased life_points when receive default_attack action" do
      player = %Player{
        name: "José Aldo Jr.",
        default_attack_name: "jeb",
        special_attack_name: "low kick",
        cure_power_name: "Dedé speach"
      }

      {:ok, player} = Player.update_life_points(player, 20, :default_attack)
      assert player.life_points == 80
    end
  end

  describe "update_life_points(player, value, :special_attack)" do
    test "it returns a player with decreased life_points when receive special_attack action" do
      player = %Player{
        name: "José Aldo Jr.",
        default_attack_name: "jeb",
        special_attack_name: "low kick",
        cure_power_name: "Dedé speach",
        life_points: 15
      }

      {:ok, player} = Player.update_life_points(player, 20, :special_attack)
      assert player.life_points == 0
    end
  end

  describe "new_player(:bot)" do
    test "it returns always same player" do
      player = Player.new_player(:bot)

      assert player.name == "Nemesis"
      assert player.default_attack_name == "Punch"
      assert player.special_attack_name == "Rocket launcher"
      assert player.cure_power_name == "Regenerate"
      assert player.life_points == 100
    end
  end

  describe "new_player(:human)" do
    test "it calls player for data and return a Player struct" do
      player = Player.new_player(:human)

      assert player.name == "Leon S. Kennedy"
      assert player.default_attack_name == "Handgun shot"
      assert player.special_attack_name == "Shotgun shot"
      assert player.cure_power_name == "Green herb"
      assert player.life_points == 100
    end
  end
end
