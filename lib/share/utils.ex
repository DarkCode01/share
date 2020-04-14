defmodule Share.Utils do
  def get_hostname do
    :os.cmd('hostname')
    |> to_string
    |> String.replace("\n", "")
  end
end