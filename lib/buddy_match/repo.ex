defmodule BuddyMatch.Repo do
  use Ecto.Repo,
    otp_app: :buddy_match,
    adapter: Ecto.Adapters.Postgres
end
