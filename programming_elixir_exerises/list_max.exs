defmodule MaxList do
  def max([]), do: nil
  def max([n]), do: n
  def max([head| tail]), do: check_max(head, tail)

  defp check_max(first, [head | tail]) when first >= head, do: max([first | tail])
  defp check_max(_first, [head | tail]), do: max([head | tail])
end
