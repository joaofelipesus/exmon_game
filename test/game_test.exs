defmodule GameTest do
  use ExUnit.Case

  test "Game struct" do
    human_player = Player.new_player(:human)
    bot_player = Player.new_player(:bot)
    game = %Game{human_player: human_player, bot_player: bot_player}

    assert game.bot_player == bot_player
    assert game.human_player == human_player
  end

  describe "setup_players/0" do
    test "it returns a Game struct with human and bot players" do
      game = Game.setup_players()

      assert game.bot_player == Player.new_player(:bot)
      assert game.human_player == Player.new_player(:human)
    end
  end

  describe "turn(p1, p2, :bot)" do

  end
end
