use Mix.Config

config :shin_admin, ShinAdminWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
