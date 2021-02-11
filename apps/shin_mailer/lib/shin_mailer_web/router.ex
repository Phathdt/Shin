defmodule ShinMailerWeb.Router do
  use ShinMailerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShinMailerWeb do
    pipe_through :api
  end
end
