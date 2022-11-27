defmodule FakeIO do
  @doc """
  This module is used only as test support, it mocks human user inputs.
  """
  def gets("Name: "), do: "José"
  def gets("Default attack: "), do: "Jeb"
  def gets("Special attack: "), do: "Low kick"
  def gets("Cure power: "), do: "Rest"
end
