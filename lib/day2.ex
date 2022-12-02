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

  def test_moves(theirs) do
    %{
      game_score(theirs, "X") => "X",
      game_score(theirs, "Y") => "Y",
      game_score(theirs, "Z") => "Z"
    }
  end

  def convert_outcome("X"), do: 0
  def convert_outcome("Y"), do: 3
  def convert_outcome("Z"), do: 6

  def convert_move(theirs, outcome) do
    theirs
    |> test_moves()
    |> Map.fetch!(convert_outcome(outcome))
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
      data
      |> Enum.map(&Advent2022.Day2.split_moves/1)
      |> Enum.map(
        fn [theirs, outcome] ->
          Advent2022.Day2.game_score(theirs, Advent2022.Day2.convert_move(theirs, outcome)) +
          Advent2022.Day2.move_score(Advent2022.Day2.convert_move(theirs, outcome))
        end)
      |> Enum.sum()
    end

  end
end
