defmodule BuddyMatch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BuddyMatch.Repo,
      # Start the Telemetry supervisor
      BuddyMatchWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BuddyMatch.PubSub},
      # Start the Endpoint (http/https)
      BuddyMatchWeb.Endpoint
      # Start a worker by calling: BuddyMatch.Worker.start_link(arg)
      # {BuddyMatch.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BuddyMatch.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BuddyMatchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
