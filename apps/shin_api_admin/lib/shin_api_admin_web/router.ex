defmodule ShinApiAdminWeb.Router do
  use ShinApiAdminWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShinApiAdminWeb do
    pipe_through :api

    get("/", PageController, :ping)
  end
end
