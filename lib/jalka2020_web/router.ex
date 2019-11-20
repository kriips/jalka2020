defmodule Jalka2020Web.Router do
  use Jalka2020Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Jalka2020Web do
    pipe_through :browser

    live "/", UserLive.Index
    live "/users", UserLive.Index
    live "/users/new", UserLive.New
    live "/users/:id", UserLive.Show
    live "/users/:id/edit", UserLive.Edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", Jalka2020Web do
  #   pipe_through :api
  # end
end
