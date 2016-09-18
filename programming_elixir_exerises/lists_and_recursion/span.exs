defmodule MyList do
  def span(from, to), do: generate_list(from, to)
  defp generate_list(from, to) when from > to, do: []
  defp generate_list(head = from, to) do
    [ head | generate_list(head + 1, to) ]
  end
end
