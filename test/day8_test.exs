defmodule Advent2022.Day8Test do
  use ExUnit.Case
  doctest Advent2022.Day8

  @test_data """
  30373
  25512
  65332
  33549
  35390\
  """

  @test_answer_1 21

  test "Day 8 A" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day8.A.solve() == @test_answer_1
  end

  @test_answer_2 :fail
  
  test "Day 8 B" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day8.B.solve() == @test_answer_2
  end

end
