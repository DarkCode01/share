defmodule Share do
  @moduledoc """
  Share module contain all function to interactive inside of node.
  """

  def inbox(message), do: IO.puts message

  def send(to, message) do
    {Share.TaskSupervisor, to}
    |> Task.Supervisor.async(__MODULE__, :inbox, [message])
    |> Task.await
  end
end
