defmodule Share do
  @moduledoc """
  Share module contain all function to interactive inside of node.
  """

  def recive_file(file) do
    IO.write file
  end

  def send(to) do
    Share.Utils.File.file_to_share
    |> do_send(to)
  end

  def do_send(%{data: data}, to) do
    {Share.TaskSupervisor, to}
    |> Task.Supervisor.async(__MODULE__, :recive_file, [data])
    |> Task.await
  end
end
