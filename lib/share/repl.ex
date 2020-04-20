defmodule Share.REPL do
  @prompt ">> "

  def run do
    IO.gets(@prompt)
    |> command_parser
  end
end