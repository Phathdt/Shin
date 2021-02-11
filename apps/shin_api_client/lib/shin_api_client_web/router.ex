defmodule ShinApiClientWeb.Router do
  use ShinApiClientWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShinApiClientWeb do
    pipe_through :api

    get("/", PageController, :ping)
  end
end
