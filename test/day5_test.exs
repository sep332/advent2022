defmodule Advent2022.Day5Test do
  use ExUnit.Case
  doctest Advent2022.Day5

  @test_data """
      [D]    
  [N] [C]    
  [Z] [M] [P]
   1   2   3 
  
  move 1 from 2 to 1
  move 3 from 1 to 3
  move 2 from 2 to 1
  move 1 from 1 to 2\
  """

  @test_answer_1 "CMZ"

  test "Day 5 A" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day5.A.solve() == @test_answer_1
  end

  @test_answer_2 "MCD"
  
  test "Day 15 B" do
    assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day5.B.solve() == @test_answer_2
  end

end
