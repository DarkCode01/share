defmodule Share.Utils.File do
@moduledoc false

  def file_to_share do
    IO.puts "Path of filename: "
    IO.read(:line)
    |> String.trim
    |> File.stream!
    |> compress_data
  end

  def compress_data(stream) do
    stream
    |> Enum.map(&to_string/1)
    |> Enum.join("")
  end

  def download_file(data) do
    IO.puts "Enter the name to save file: "
    
    IO.read(:line)
    |> String.trim
    |> make_filename(".exs")
    |> File.write(data)
  end

  def make_filename(name, ext) do
    "#{name}.#{ext}"
  end
end