defmodule Vixet.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(Vixet.User) do
    [%Vixet.User{id: "1", name: "Aaron", username: "Aaron Master", password: "elixir"},
     %Vixet.User{id: "2", name: "Brad", username: "Brad Nelson", password: "phoenix"},
     %Vixet.User{id: "3", name: "Charlie", username: "Charlie Owens", password: "OTP"}]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
