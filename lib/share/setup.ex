defmodule Share.Setup do
    @moduledoc false

    use Task

    def start_link([]) do
      IO.puts "Init setup..."

      Task.async(__MODULE__, :run, [])
      Task.await()
    end

    def run do
      IO.puts "Creating folders..."

      Application.get_env(:share, :home_path).() <> "/share/downloads"
      |> File.exists?
      |> Share.Utils.File.make_folder_downloads
      |> success?
    end

    def success?({:ok, :success}), do: IO.puts "Success"
    def success?({:error, reason}), do: IO.puts reason
end