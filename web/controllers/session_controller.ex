defmodule Vixet.SessionController do
  use Vixet.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end
end
