defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do #defp defines a private method
    a + b
  end
end

IO.puts Math.sum(1,2)
