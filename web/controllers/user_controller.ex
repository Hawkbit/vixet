defmodule Vixet.UserController do
  use Vixet.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Vixet.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Vixet.User, id)
    render conn, "show.html", user: user
  end

  alias Vixet.User
  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end
end
