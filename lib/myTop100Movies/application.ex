defmodule MyTop100Movies.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MyTop100Movies.Repo,
      # Start the Telemetry supervisor
      MyTop100MoviesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MyTop100Movies.PubSub},
      # Start the Endpoint (http/https)
      MyTop100MoviesWeb.Endpoint
      # Start a worker by calling: MyTop100Movies.Worker.start_link(arg)
      # {MyTop100Movies.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyTop100Movies.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyTop100MoviesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
