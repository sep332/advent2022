defmodule Advent2022.Day3 do
  def real_data do
    File.read!("priv/day3.txt")
    |> Advent2022.Util.parse_strings()
  end

  def compartmentize(items) do
    items
    |> Enum.split(round(length(items) / 2))
  end

  def score_item([item]) when is_binary(item) do
    item
    |> :binary.first()
    |> score_item()
  end

  def score_item(item) when item >= 65 and item <= 90 do
    item - 38
  end

  def score_item(item) when item >= 97 and item <= 122 do
    item - 96
  end

  defmodule A do

    def solve(data) do
      data
      |> Enum.map(&String.split(&1, "", trim: true))
      |> Enum.map(&Advent2022.Day3.compartmentize/1)
      |> Enum.map(fn {front, back} -> MapSet.intersection(MapSet.new(front), MapSet.new(back)) |> MapSet.to_list() end)
      |> Enum.map(&Advent2022.Day3.score_item/1)
      |> Enum.sum()
    end

  end

  defmodule B do

    def solve(data) do
      data
      |> Enum.map(&String.split(&1, "", trim: true))
      |> Enum.chunk_every(3)
      |> Enum.map(fn [first, second, third] ->
        MapSet.intersection(MapSet.new(first), MapSet.new(second))
        |> MapSet.intersection(MapSet.new(third))
        |> MapSet.to_list()
      end)
      |> Enum.map(&Advent2022.Day3.score_item/1)
      |> Enum.sum()
    end

  end
end
