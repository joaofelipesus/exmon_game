defmodule Game do
  defstruct human_player: nil,
            bot_player: nil

  @actions [:default_attack, :special_attack, :cure_power]

  def setup_players do
    human_player = Player.new_player(:human)
    bot_player = Player.new_player(:bot)

    %__MODULE__{
      human_player: human_player,
      bot_player: bot_player
    }
  end

  def turn(human, bot, performer) do
    action = select_action()
    value = calc_move_value(action)

    case action do
      :cure_power ->
        {:ok, human: updated_human, bot: updated_bot } = perform_cure_power(human, bot, value, performer)
        print_players_life_points(updated_human, updated_bot)
        turn(updated_human, updated_bot, next_player(performer))
      _ ->
        { :ok, human: updated_human, bot: updated_bot} = perform_attack(performer, human, bot, action, value)
        print_players_life_points(updated_human, updated_bot)

        cond do
          target_player(performer, updated_human, updated_bot).life_points > 0 ->
            turn(updated_human, updated_bot, next_player(performer))

          target_player(performer, updated_human, updated_bot).life_points == 0 ->
            IO.puts("O jogo acabou")
        end
    end
  end

  defp perform_attack(performer, human, bot, action, value) do
    attacked_player = target_player(performer, human, bot)
    performer_player = perform_player(performer, human, bot)
    Turn.print(performer_player, attacked_player, action, value)
    case performer do
      :human ->
        {:ok, updated_bot} = Player.update_life_points(bot, value, action)
        {
          :ok,
          human: human,
          bot: updated_bot
        }
      :bot ->
        {:ok, updated_human} = Player.update_life_points(human, value, action)
        {
          :ok,
          human: updated_human,
          bot: bot
        }
    end
  end

  defp select_action do
    action_index = Enum.random(0..2)

    Enum.at(@actions, action_index)
  end

  defp calc_move_value(action) do
    apply(Player, action, [])
  end

  defp print_players_life_points(human, bot) do
    IO.puts("BOT: #{bot.life_points}  -  HUMAN: #{human.life_points}")
    IO.puts("=======================================================================")
  end

  defp perform_cure_power(human, bot, value, performer) do
    case performer do
      :human ->
        Turn.print(human, human, :cure_power, value)
        {:ok, updated_human} = Player.update_life_points(human, value, :cure_power)
        {
          :ok,
          human: updated_human,
          bot: bot
        }
      :bot ->
        Turn.print(bot, bot, :cure_power, value)
        {:ok, updated_bot} = Player.update_life_points(bot, value, :cure_power)
        {
          :ok,
          human: human,
          bot: updated_bot
        }
    end
  end

  defp next_player(:human) do
    :bot
  end

  defp next_player(:bot) do
    :human
  end

  defp target_player(:human, _human, bot) do
    bot
  end

  defp target_player(:bot, human, _bot) do
    human
  end

  defp perform_player(:human, human, _bot) do
    human
  end

  defp perform_player(:bot, _human, bot) do
    bot
  end
end
