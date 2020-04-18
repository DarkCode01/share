defmodule Share.Application do
  @moduledoc false

  use Application

  @doc false
  def start(_type, _args) do
    children = [
      {Share.Setup, []},
      {Share.Server, []},
      {Task.Supervisor, name: Share.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: Share.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
