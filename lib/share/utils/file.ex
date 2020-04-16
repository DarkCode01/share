defmodule Share.Utils.File do
  @moduledoc false

  @home_path Application.get_env(:share, :home_path)
  @download_path "/share/downloads"

  def file_to_share(filename) do
    filename
    |> String.trim
    |> File.stream!
    |> compress_data
  end

  def compress_data(stream) do
    stream
    |> Enum.map(&to_string/1)
    |> Enum.join("")
    |> file_payload(stream.path)
  end

  def file_payload(data, path) do
    {{year, month, day}, {_, _, _}} = :calendar.local_time
    {:ok, ext} = String.split(path, ".")
      |> Enum.reverse
      |> Enum.fetch(0)

    ["/#{year}-#{month}-#{day}.#{ext}", data]
  end

  def download_file(path, data) do
    path
    |> String.trim
    |> add_complete_path
    |> File.write(data)
  end

  def add_complete_path(path) do
    @home_path <> @download_path <> path
  end

  def make_folder_downloads(true), do: {:ok, :success}
  def make_folder_downloads(false) do
    case File.mkdir_p(@home_path <> @download_path) do
      :ok -> {:ok, :success}
      {:error, reason} -> {:error, reason}
    end
  end
end