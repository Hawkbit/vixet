defmodule Vixet.Router do
  use Vixet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Vixet.Auth, repo: Vixet.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Vixet do
    pipe_through :browser # Use the default browser stack
    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Vixet do
  #   pipe_through :api
  # end
end
