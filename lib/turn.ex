defmodule Turn do
  def print(player, action, value) do
    IO.puts("#{player.name}  -  #{formatted_action(action)}  -  #{value}")
  end

  defp formatted_action(action) do
    case action do
      :default_attack -> "#{IO.ANSI.yellow()}default attack#{reset_color()}"
      :special_attack -> "#{IO.ANSI.red()}special attack#{reset_color()}"
      :cure -> "#{IO.ANSI.green()}cure#{reset_color()}"
    end
  end

  defp reset_color do
    IO.ANSI.white()
  end
end
