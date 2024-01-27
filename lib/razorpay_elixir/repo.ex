defmodule RazorpayElixir.Repo do
  use Ecto.Repo,
    otp_app: :razorpay_elixir,
    adapter: Ecto.Adapters.Postgres
end
