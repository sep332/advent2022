defmodule Advent2022.Day25Test do
    use ExUnit.Case
    doctest Advent2022.Day25
  
    @test_data """
    1=-0-2
    12111
    2=0=
    21
    2=01
    111
    20012
    112
    1=-1=
    1-12
    12
    1=
    122\
    """
  
    @test_answer_1 "2=-1=0"
  
    test "Day 25 A" do
      assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day25.A.solve() == @test_answer_1
    end

    
    @test_answer_2 :fail
    
    test "Day 25 B" do
      assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day25.B.solve() == @test_answer_2
    end
  
  end
  