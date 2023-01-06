defmodule Advent2022.Day21Test do
    use ExUnit.Case
    doctest Advent2022.Day21
  
    @test_data """
    root: pppw + sjmn
    dbpl: 5
    cczh: sllz + lgvd
    zczc: 2
    ptdq: humn - dvpt
    dvpt: 3
    lfqf: 4
    humn: 5
    ljgn: 2
    sjmn: drzm * dbpl
    sllz: 4
    pppw: cczh / lfqf
    lgvd: ljgn * ptdq
    drzm: hmdt - zczc
    hmdt: 32\
    """
  
    @test_answer_1 152
  
    test "Day 21 A" do
      assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day21.A.solve() == @test_answer_1
    end

    
    @test_answer_2 :fail
    
    test "Day 21 B" do
      assert @test_data |> Advent2022.Util.parse_strings() |> Advent2022.Day21.B.solve() == @test_answer_2
    end
  
  end
  