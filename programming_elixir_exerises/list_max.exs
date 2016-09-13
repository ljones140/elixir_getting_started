defmodule MaxList do
  def max([n]), do: n
  def max([head | tail]), do: check_max(head, tail)

  defp check_max(first, [head | tail]) when first >= head do
    max([first | tail])
  end
  defp check_max(first, [head | tail]) when first <= head do
    max([head | tail])
  end
end