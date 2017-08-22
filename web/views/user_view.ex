defmodule Vixet.UserView do
  use Vixet.Web, :view

  alias Vixet.User
  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
