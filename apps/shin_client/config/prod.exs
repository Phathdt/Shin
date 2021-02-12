use Mix.Config

config :shin_client, ShinClientWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :shin_client, ShinClientWeb.Endpoint, server: true
