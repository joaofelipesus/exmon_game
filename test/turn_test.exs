defmodule TurnTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    player = %Player{
      name: "asuka",
      special_attack_name: "kick",
      default_attack_name: "scream",
      cure_power_name: "sleep"
    }

    {:ok, player: player}
  end

  describe "print/3" do
    test "prints green value when cure", context do
      assert capture_io(fn -> Turn.print(context[:player], :cure, 15) end) ==
               "asuka  -  \e[32mcure\e[37m  -  15\n"
    end

    test "prints yellow value when default attack", context do
      assert capture_io(fn -> Turn.print(context[:player], :default_attack, 15) end) ==
               "asuka  -  \e[33mdefault attack\e[37m  -  15\n"
    end

    test "prints red value when special attack", context do
      assert capture_io(fn -> Turn.print(context[:player], :special_attack, 15) end) ==
               "asuka  -  \e[31mspecial attack\e[37m  -  15\n"
    end
  end
end
