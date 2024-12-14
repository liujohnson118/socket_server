defmodule SocketServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      SocketServerWeb.Endpoint,
      {Absinthe.Subscription, [SocketServerWeb.Endpoint]}
      # Starts a worker by calling: SocketServer.Worker.start_link(arg)
      # {SocketServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SocketServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SocketServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
