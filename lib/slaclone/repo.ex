defmodule Slaclone.Repo do
  use Ecto.Repo,
    otp_app: :slaclone,
    adapter: Ecto.Adapters.Postgres
end
