defmodule Advent2022.Day1 do
  def real_data do
    File.read!("priv/day1.txt")
    |> Advent2022.Util.parse_ints()
  end

  @doc "If there is a blank line, start counting calories for a new elf. Otherwise add the new calories to the current elf."
  def add_or_append(_item = nil, elves) do
    [0 | elves]
  end

  def add_or_append(item, []) do
    [item]
  end

  def add_or_append(item, [latest_elf | elves]) do
    [latest_elf + item | elves]
  end

  defmodule A do

    @doc "Return the highest calorie count"
    def solve(data) do
      data
      |> Enum.reduce([], &Advent2022.Day1.add_or_append/2)
      |> Enum.sort()
      |> Enum.reverse()
      |> hd()
    end

  end

  defmodule B do

    @doc "Return the sum of the three highest calorie counts"
    def solve(data) do
      data
      |> Enum.reduce([], &Advent2022.Day1.add_or_append/2)
      |> Enum.sort()
      |> Enum.reverse()
      |> Enum.take(3)
      |> Enum.sum()
    end

  end
end
