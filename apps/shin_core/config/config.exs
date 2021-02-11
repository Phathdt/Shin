use Mix.Config

config :shin_core,
  ecto_repos: [ShinCore.Repo]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
