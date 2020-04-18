defmodule Share.Setup do
    @moduledoc false

    use Task

    @doc false
    def start_link([]) do
      IO.puts "Init setup..."

      # task = Task.async(Share.Setup, :run, [])
      # Task.await(task)
      Task.start_link(__MODULE__, :run, [])
    end

    @doc false
    def run do
      IO.puts "Creating folders..."

      Application.get_env(:share, :home_path) <> "/share/downloads"
      |> File.exists?
      |> Share.Utils.File.make_folder_downloads
      |> success?
    end

    @doc false
    def success?({:ok, :success}), do: IO.puts "Success"
    def success?({:error, reason}), do: IO.puts reason
end