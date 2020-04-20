defmodule Share.Setup do
    @moduledoc false
    @folder Share.Utils.get_home_path <> "/share/downloads"
    
    use Task

    require Logger

    @doc false
    def start_link([]) do
      Task.start_link(__MODULE__, :run, [])
    end

    @doc false
    def run do
      @folder
      |> File.exists?
      |> Share.Utils.File.make_folder_downloads
      |> success?
    end

    @doc false
    def success?({:ok, :success}) do
      Logger.info(fn 
        -> "Created folder on #{@folder}."
      end)
      Logger.info "All files downloaded storage on that folder."

      finish()
    end
    def success?({:error, reason}) do
      Logger.error(fn
        -> "Error trying to create folder on #{@folder}"
      end)
      Logger.error(fn
        -> "Reason of error: #{reason}"
      end)

      finish()
    end
    def success?({:ok, _}) do
      finish()
    end

    def finish do
      Logger.info "Finished setup of share package."
    end
end