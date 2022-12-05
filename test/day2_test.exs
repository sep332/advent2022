defmodule Advent2022.Day2Test do
  use ExUnit.Case
  doctest Advent2022.Day2

  @test_data """
  A Y
  B X
  C Z\
  """

  @test_answer_1 15

  test "Day 2 A" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day2.A.solve() == @test_answer_1
  end

  @test_answer_2 12

  test "Day 2 B" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day2.B.solve() == @test_answer_2
  end

end
