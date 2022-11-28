defmodule Turn do
  def print(perform_player, receive_player, action, value) do
    IO.puts(
      "Performed: #{perform_player.name} | Received: #{receive_player.name} |  #{formatted_action(action)} |  #{value}"
    )
  end

  defp formatted_action(action) do
    case action do
      :default_attack -> "#{IO.ANSI.yellow()}default attack#{reset_color()}"
      :special_attack -> "#{IO.ANSI.red()}special attack#{reset_color()}"
      :cure_power -> "#{IO.ANSI.green()}cure power#{reset_color()}"
    end
  end

  defp reset_color do
    IO.ANSI.white()
  end
end
