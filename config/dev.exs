use Mix.Config

config :share, home_path: fn -> :os.cmd('echo $HOME') |> to_string |> String.trim end