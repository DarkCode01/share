use Mix.Config

config :share, hostname: :os.cmd('hostname') |> to_string |> String.trim
config :share, home_path: fn -> :os.cmd('echo $HOME') |> to_string |> String.trim end