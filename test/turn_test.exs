defmodule TurnTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  setup do
    human_player = Player.new_player(:human)
    bot_player = Player.new_player(:bot)

    {:ok, human_player: human_player, bot_player: bot_player}
  end

  describe "print/4" do
    test "prints green value when cure", context do
      assert capture_io(fn ->
               Turn.print(context[:human_player], context[:bot_player], :cure_power, 15)
             end) ==
               "Performed: Leon S. Kennedy | Received: Nemesis |  \e[32mcure power\e[37m |  15\n"
    end

    test "prints yellow value when default attack", context do
      assert capture_io(fn ->
               Turn.print(context[:human_player], context[:bot_player], :default_attack, 15)
             end) ==
               "Performed: Leon S. Kennedy | Received: Nemesis |  \e[33mdefault attack\e[37m |  15\n"
    end

    test "prints red value when special attack", context do
      assert capture_io(fn ->
               Turn.print(context[:human_player], context[:bot_player], :special_attack, 15)
             end) ==
               "Performed: Leon S. Kennedy | Received: Nemesis |  \e[31mspecial attack\e[37m |  15\n"
    end
  end
end
