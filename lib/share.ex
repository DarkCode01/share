defmodule Share do
  @moduledoc """
  Share module contain all function to interactive inside of node.
  """

  @doc """
  Function to read filename...

  ## Examples

      iex> Share.file_to_share
      test.txt
      %{data: "No found!", path: "test.txt"}

  """
  def file_to_share do
    IO.puts "Path of filename: "
    IO.read(:line)
    |> String.trim
    |> Share.do_file_to_share
  end

  def do_file_to_share(filename) do
    case File.read(filename) do
      {:ok, data} ->
        %{path: filename, data: data}
      {:error, :enoent} ->
        %{path: filename, data: "No found!"}
    end
  end
end
