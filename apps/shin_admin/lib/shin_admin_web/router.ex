defmodule ShinAdminWeb.Router do
  use ShinAdminWeb, :router
  use VerkWeb.MountRoute, path: "/verk"

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShinAdminWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward("/api", ShinApiAdminWeb.Router)
end
