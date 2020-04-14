defmodule Share.Utils do
  def get_hostname do
    :os.cmd('hostname')
    |> to_string
    |> String.trim
  end

  def file_to_share do
    IO.puts "Path of filename: "
    IO.read(:line)
    |> String.trim
    |> do_file_to_share
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