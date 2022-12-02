defmodule Advent2022.Day2 do
  def real_data do
    File.read!("priv/day2.txt")
    |> Advent2022.Util.parse_strings()
  end

  def move_score("X"), do: 1
  def move_score("Y"), do: 2
  def move_score("Z"), do: 3

  @doc "0 for a loss, 3 for a draw, 6 for a win"
  def game_score("A", "Y"), do: 6
  def game_score("B", "Z"), do: 6
  def game_score("C", "X"), do: 6
  def game_score("A", "X"), do: 3
  def game_score("B", "Y"), do: 3
  def game_score("C", "Z"), do: 3
  def game_score(_, _), do: 0

  @doc "split each line into a list of [opponent's move, our move]"
  def split_moves(line) do
    line
    |> String.split(" ")
  end

  defmodule A do

    def solve(data) do
      data
      |> Enum.map(&Advent2022.Day2.split_moves/1)
      |> Enum.map(fn [theirs, ours] -> Advent2022.Day2.game_score(theirs, ours) + Advent2022.Day2.move_score(ours) end)
      |> Enum.sum()
    end

  end

  defmodule B do

    def solve(data) do

    end

  end
end
