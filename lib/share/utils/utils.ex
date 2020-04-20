defmodule Share.Utils do
  def get_username do
    'whoami'
    |> :os.cmd
    |> parser
  end

  def get_hostname do
    'hostname'
    |> :os.cmd
    |> parser
  end

  def get_home_path do
    :os.cmd('echo $HOME')
    |> parser
  end

  def parser(to_parser) do
    to_parser
    |> to_string
    |> String.trim
  end

  def generate_secret do
    :crypto.strong_rand_bytes(16)
    |> Base.encode16
    |> String.to_atom
  end
end