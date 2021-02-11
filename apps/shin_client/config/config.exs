use Mix.Config

# Configures the endpoint
config :shin_client, ShinClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qKTE/mlxy9k5iAViwblJhEbVBb8yUpQ8omgCmxe5qgbUI42vMQaLrLaTdn4/yhQm",
  render_errors: [view: ShinClientWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ShinClient.PubSub,
  live_view: [signing_salt: "T4PYJBtx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
