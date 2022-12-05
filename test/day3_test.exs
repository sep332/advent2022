defmodule Advent2022.Day3Test do
  use ExUnit.Case
  doctest Advent2022.Day3

  @test_data """
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw\
  """

  @test_answer_1 157

  test "Day 3 A" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day3.A.solve() == @test_answer_1
  end

  @test_answer_2 70

  test "Day 3 B" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day3.B.solve() == @test_answer_2
  end

end
