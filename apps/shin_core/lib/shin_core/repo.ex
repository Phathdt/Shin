defmodule ShinCore.Repo do
  use Ecto.Repo,
    otp_app: :shin_core,
    adapter: Ecto.Adapters.Postgres
end
