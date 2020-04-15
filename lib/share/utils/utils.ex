defmodule Share.Utils do
  @moduledoc false

  def get_hostname do
    :os.cmd('hostname')
    |> to_string
    |> String.trim
  end
end