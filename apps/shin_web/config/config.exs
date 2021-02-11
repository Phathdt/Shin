use Mix.Config

config :shin_web, ShinWebWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nkOdQHk4ERgZOu/pkcwtoNaOgmJcmLMCwF4hMhMzQPHVXl1tAFLEAfQ+5kJQael9",
  render_errors: [view: ShinWebWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ShinWeb.PubSub,
  live_view: [signing_salt: "1IEQUt3l"]

import_config "#{Mix.env()}.exs"
