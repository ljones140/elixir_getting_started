defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

    iex>Math.sum(1,2)
    3

  """

  @doc """
  Calculates the sum of two numbers
  """
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do #defp defines a private method
    a + b
  end
end

IO.puts Math.sum(1,2)

# this enables h to be called on module and methods and documentation will be
# displayed
