defmodule Share do
  @moduledoc """
  Module to manage send and recive files from others Nodes.
  """

  @doc false
  def recive_file(path, data) do
    Share.Utils.File.download_file(path, data)
  end

  @doc false
  def send(to: to, filename: filename) do
    Share.Utils.File.file_to_share(filename)
    |> do_send(to)
  end

  @doc """
  This function init ther Task Supervisor to send trhe data of
  file to the node indicated.
  """
  defp do_send(file, to) do
    {Share.TaskSupervisor, to}
    |> Task.Supervisor.async(__MODULE__, :recive_file, file)
    |> Task.await
  end
end
