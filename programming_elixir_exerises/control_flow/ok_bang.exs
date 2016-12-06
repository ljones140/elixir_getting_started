defmodule Ok do

  def ok!({:ok, argument}), do: argument
  def ok!({:error, message}) do
    raise  to_string(message)
  end
end
