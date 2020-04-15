defmodule Share.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Share.Worker.start_link(arg)
      {Share.Setup, []}, 
      {Share.Server, []},
      {Task.Supervisor, name: Share.TaskSupervisor},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Share.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
