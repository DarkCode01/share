defmodule Share do
  @moduledoc """
  Share module contain all function to interactive inside of node.
  """

  def recive_file(name: _name, data: _data) do
    # Share.Utils.File.download_file(file)
    true
  end

  def send(to: to, filename: filename) do
    Share.Utils.File.file_to_share(filename)
    |> do_send(to)
  end

  def do_send(file, to) do
    {Share.TaskSupervisor, to}
    |> Task.Supervisor.async(__MODULE__, :recive_file, file)
    |> Task.await
  end
end
