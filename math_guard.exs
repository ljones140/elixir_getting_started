defmodule Math do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end

IO.puts Math.zero?(0) #=> true as matches first clause
IO.puts Math.zero?(1) #=> false as matches second clause
IO.puts Math.zero?([1,2,3]) #=> ** (FunctionClauseError)
