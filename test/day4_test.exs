defmodule Advent2022.Day4Test do
  use ExUnit.Case
  doctest Advent2022.Day4

  @test_data """
  2-4,6-8
  2-3,4-5
  5-7,7-9
  2-8,3-7
  6-6,4-6
  2-6,4-8\
  """

  @test_answer_1 2

  test "Day 4 A" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day4.A.solve() == @test_answer_1
  end

  @test_answer_2 :fail

  test "Day 4 B" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day4.B.solve() == @test_answer_2
  end

end
