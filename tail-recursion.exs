defmodule TailRecursion do
  def list_len(list) do
    do_list_len(0, list)
  end

  defp do_list_len(len, [_head | tail]) do
    do_list_len(len + 1, tail)
  end

  defp do_list_len(len, []) do
    len
  end

  def range(from, to) do
    step =
      if from <= to do
        1
      else
        -1
      end

    do_range(from, to, step, [])
  end

  def do_range(to, to, _step, list) do
    list ++ [to]
  end

  def do_range(from, to, step, list) do
    do_range(from + step, to, step, list ++ [from])
  end

  def positive(list) do
    do_positive(list, [])
  end

  defp do_positive([], result) do
    result
  end

  defp do_positive([head | tail], result) when head > 0 do
    do_positive(tail, result ++ [head])
  end

  defp do_positive([_ | tail], result) do
    do_positive(tail, result)
  end
end
