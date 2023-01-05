defmodule Advent2022.Day13Test do
    use ExUnit.Case
    doctest Advent2022.Day10
  
    @test_data """
    [1,1,3,1,1]
    [1,1,5,1,1]

    [[1],[2,3,4]]
    [[1],4]

    [9]
    [[8,7,6]]

    [[4,4],4,4]
    [[4,4],4,4,4]

    [7,7,7,7]
    [7,7,7]

    []
    [3]

    [[[]]]
    [[]]

    [1,[2,[3,[4,[5,6,7]]]],8,9]
    [1,[2,[3,[4,[5,6,0]]]],8,9]\
    """
  
    @test_answer_1 13
  
    test "Day 13 A" do
      assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day13.A.solve() == @test_answer_1
    end

    
    @test_answer_2 140
    
    test "Day 13 B" do
      assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day13.B.solve() == @test_answer_2
    end
  
  end
  