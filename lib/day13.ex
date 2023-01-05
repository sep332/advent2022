defmodule Advent2022.Day13 do
  def real_data do
    File.read!("priv/day13.txt")
    |> Advent2022.Util.parse_strings()
  end

  def is_ordered({[list1, list2, _], index}) do
    rules(list1, list2) * (index + 1)
  end
  def is_ordered({[list1, list2], index}) do
    rules(list1, list2) * (index + 1)
  end
  
  def rules([a | _], [b | _]) when is_integer(a) and is_integer(b) and a < b do
    1
  end

  def rules([a | rest_a], [b | rest_b]) when is_integer(a) and is_integer(b) and a == b do
    rules(rest_a, rest_b)
  end

  def rules(a, b) when a == b do
    :maybe
  end

  def rules([a | rest_a], [b | rest_b]) do
    rules(a, b)
    |> case do
      :maybe -> rules(rest_a, rest_b)
      other -> other
    end
  end

  def rules([], []) do
    0
  end

  def rules([], _) do
    1
  end

  def rules(a, b) when not is_list(a) and is_list(b) do
    rules([a], b)
  end
  def rules(a, b) when is_list(a) and not is_list(b) do
    rules(a, [b])
  end

  def rules(_, _), do: 0

  defmodule A do

    def solve(data) do
      data
      |> Enum.map(fn line -> line |> Code.eval_string() |> Tuple.to_list() |> hd() end) # Don't run this on untrusted data, it will pwn your machine
      |> Enum.chunk_every(3)
      |> Enum.with_index()
      |> Enum.map(&Advent2022.Day13.is_ordered/1)
      #|> Enum.filter(fn {ordered, index} -> ordered * index end)
      |> Enum.sum()
    end

  end

  defmodule B do

    def solve(data) do
      
    end

  end
end
