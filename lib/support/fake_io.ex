defmodule FakeIO do
  def gets("Name: "), do: "José"
  def gets("Default attack: "), do: "Jeb"
  def gets("Special attack: "), do: "Low kick"
  def gets("Cure power: "), do: "Rest"
end
