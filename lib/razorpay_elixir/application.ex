defmodule RazorpayElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RazorpayElixirWeb.Telemetry,
      # Start the Ecto repository
      RazorpayElixir.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: RazorpayElixir.PubSub},
      # Start Finch
      {Finch, name: RazorpayElixir.Finch},
      # Start the Endpoint (http/https)
      RazorpayElixirWeb.Endpoint
      # Start a worker by calling: RazorpayElixir.Worker.start_link(arg)
      # {RazorpayElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RazorpayElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RazorpayElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
