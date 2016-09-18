defmodule MyList do
  def caesar([], _), do: []
  def caesar([head | tail], n), do: ( [ add_to_char(head, n) | caesar(tail, n) ])

  defp add_to_char(char, n) when char > 122, do: add_to_char(97, n)
  defp add_to_char(char, n), do: char + n
end
