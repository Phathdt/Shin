defmodule ShinAdmin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShinAdminWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShinAdmin.PubSub},
      # Start the Endpoint (http/https)
      ShinAdminWeb.Endpoint
      # Start a worker by calling: ShinAdmin.Worker.start_link(arg)
      # {ShinAdmin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShinAdmin.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
