defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(head = from, to) do
    [ head | span(head + 1, to) ]
  end
end
