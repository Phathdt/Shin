defmodule ShinCore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Redix, {System.get_env("REDIS_URL"), [name: :redix_api]}},
      # Start the Ecto repository
      ShinCore.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShinCore.PubSub}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShinCore.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
