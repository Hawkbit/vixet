defmodule Vixet.PageController do
  use Vixet.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
