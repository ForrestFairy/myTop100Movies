defmodule MyTop100Movies.Repo do
  use Ecto.Repo,
    otp_app: :myTop100Movies,
    adapter: Ecto.Adapters.Postgres
end
