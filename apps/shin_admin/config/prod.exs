use Mix.Config

config :shin_admin, ShinAdminWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :shin_admin, ShinAdminWeb.Endpoint, server: true
