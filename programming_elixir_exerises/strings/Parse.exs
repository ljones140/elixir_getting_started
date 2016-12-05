defmodule Parse do

  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str),           do: _number_digits(str,  0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
  when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end

  def printable?([]), do: false
  def printable?(char_list), do: _printable(char_list)

  defp _printable([]), do: true
  defp _printable([ head | tail]) when head in 32..126 do
    _printable(tail)
  end
  defp _printable(_), do: false

  def anagram?(word_1, word_2) do
    _to_sorted_list(word_1) == _to_sorted_list(word_2)
  end

  defp _to_sorted_list(str), do: to_charlist(str) |> Enum.sort

  def calculate(list), do: _calculate([], list)

  defp _calculate(left, [ head | tail ]) when head in 48..57 do
    _calculate(left ++ [head], tail)
  end

  defp _calculate(left, [ head | tail]) when head == 42 do
    _to_num(left) * _to_num(tail)
  end

  defp _calculate(left, [ head | tail]) when head == 43 do
    _to_num(left) + _to_num(tail)
  end

  defp _calculate(left, [ head | tail]) when head == 45 do
    _to_num(left) - _to_num(tail)
  end

  defp _calculate(left, [ head | tail]) when head == 47 do
    _to_num(left) / _to_num(tail)
  end

  defp _to_num(char_list) do
   number_string =  to_string(char_list)
   String.to_integer(number_string)
  end
end


