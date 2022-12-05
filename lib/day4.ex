defmodule Advent2022.Day4 do
  def real_data do
    File.read!("priv/day4.txt")
    |> Advent2022.Util.parse_strings()
  end

  def parse_ranges(line) do
    [_full, first_begin, first_end, second_begin, second_end] =
    ~r/([\d]+)-([\d]+),([\d]+)-([\d]+)/
    |> Regex.run(line)

    [first_begin, first_end, second_begin, second_end]
    |> Enum.map(&String.to_integer/1)
  end

  defmodule A do

    def solve(data) do
      data
      |> Enum.map(&Advent2022.Day4.parse_ranges/1)
      |> Enum.filter(
        fn [first_begin, first_end, second_begin, second_end] ->
          (first_begin <= second_begin && first_end >= second_end) ||
          (second_begin <= first_begin && second_end >= first_end)
        end
      )
      |> length()
    end

  end

  defmodule B do

    def solve(data) do
      data
      |> Enum.map(&Advent2022.Day4.parse_ranges/1)
      |> Enum.filter(
        fn [first_begin, first_end, second_begin, second_end] ->
          (first_begin <= second_begin && first_end >= second_begin) ||
          (second_begin <= first_begin && second_end >= first_begin)
        end
      )
      |> length()
    end

  end
end
