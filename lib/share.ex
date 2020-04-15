defmodule Share do
  @moduledoc """
  Share module contain all function to interactive inside of node.
  """

  def recive_file(file) do
    IO.puts file

    Share.Utils.File.download_file(file)
  end

  def send(to) do
    Share.Utils.File.file_to_share |> do_send(to)
  end

  def do_send(file, to) do
    {Share.TaskSupervisor, to}
    |> Task.Supervisor.async(__MODULE__, :recive_file, [file])
    |> Task.await
  end
end
