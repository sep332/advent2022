defmodule Advent2022.Day1Test do
  use ExUnit.Case
  doctest Advent2022.Day1

  @test_data """
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000\
  """

  @test_answer_1 24000

  test "Day 1 A" do
    assert @test_data |> Advent2022.Util.parse_ints() |> Advent2022.Day1.A.solve() == @test_answer_1
  end

  @test_answer_2 45000
  
  test "Day 1 B" do
    assert @test_data |> Advent2022.Util.parse_ints() |> Advent2022.Day1.B.solve() == @test_answer_2
  end

end
