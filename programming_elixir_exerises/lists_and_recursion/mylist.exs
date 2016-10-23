defmodule MyList do
  def len([]),             do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]),              do: []
  def square([ head | tail ]), do: [ head * head | square(tail) ]

  def add_one([]),              do: []
  def add_one([ head | tail ]), do: [ head + 1 | add_one(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def sum(list), do: _sum(list, 0)
  defp _sum([], total),              do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head + total)

  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def all?([], _func), do: true
  def all?([head | tail], func) do
     func.(head) && all?(tail, func)
  end

  def each([], _func), do: []
  def each([ head | tail ], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  def split(list, count), do: _split(list, count,{ [], [] })

  defp _split([], count, result), do: result
  defp _split(list, count, result) when count < 0 do
    _split(list, length(list) + count, result)
  end
  defp _split([ head | tail ], count, { left, right }) when length(left) < count do
    _split(tail, count, { left ++ [head], right })
  end
  defp _split([ head | tail ], count, { left, right }) do
    _split(tail, count, { left, right ++ [head]})
  end
end
