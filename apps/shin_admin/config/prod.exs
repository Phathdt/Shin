use Mix.Config

config :shin_admin, ShinAdminWeb.Endpoint,
  url: [host: "35.213.174.112", port: 7000],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :shin_admin, ShinAdminWeb.Endpoint, server: true
