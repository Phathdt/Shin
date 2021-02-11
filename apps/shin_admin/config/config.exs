use Mix.Config

config :shin_admin, ShinAdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K7rXuyS+NF9B6lqLGKLnWevu/EjVNoAgQsMcv859dN8jXwQWsQM51KPfy6/et+Fe",
  render_errors: [view: ShinAdminWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ShinAdmin.PubSub,
  live_view: [signing_salt: "OkcsZUDn"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
