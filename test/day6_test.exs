defmodule Advent2022.Day6Test do
  use ExUnit.Case
  doctest Advent2022.Day6

  @test_data_a1 "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
  @test_data_a2 "bvwbjplbgvbhsrlpgdmjqwftvncz"
  @test_data_a3 "nppdvjthqldpwncqszvftbrmjlhg"
  @test_data_a4 "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
  @test_data_a5 "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

  @test_answer_a1 7
  @test_answer_a2 5
  @test_answer_a3 6
  @test_answer_a4 10
  @test_answer_a5 11

  test "Day 6 A1" do
    assert @test_data_a1 |> Advent2022.Day6.A.solve() == @test_answer_a1
  end

  test "Day 6 A2" do
    assert @test_data_a2 |> Advent2022.Day6.A.solve() == @test_answer_a2
  end

  test "Day 6 A3" do
    assert @test_data_a3 |> Advent2022.Day6.A.solve() == @test_answer_a3
  end

  test "Day 6 A4" do
    assert @test_data_a4 |> Advent2022.Day6.A.solve() == @test_answer_a4
  end

  test "Day 6 A5" do
    assert @test_data_a5 |> Advent2022.Day6.A.solve() == @test_answer_a5
  end


  @test_data_b1 "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
  @test_data_b2 "bvwbjplbgvbhsrlpgdmjqwftvncz"
  @test_data_b3 "nppdvjthqldpwncqszvftbrmjlhg"
  @test_data_b4 "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
  @test_data_b5 "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

  @test_answer_b1 19
  @test_answer_b2 23
  @test_answer_b3 23
  @test_answer_b4 29
  @test_answer_b5 26

  test "Day 6 B 1" do
    assert @test_data_b1 |> Advent2022.Day6.B.solve() == @test_answer_b1
  end

  test "Day 6 B 2" do
    assert @test_data_b2 |> Advent2022.Day6.B.solve() == @test_answer_b2
  end

  test "Day 6 B 3" do
    assert @test_data_b3 |> Advent2022.Day6.B.solve() == @test_answer_b3
  end

  test "Day 6 B 4" do
    assert @test_data_b4 |> Advent2022.Day6.B.solve() == @test_answer_b4
  end

  test "Day 6 B 5" do
    assert @test_data_b5 |> Advent2022.Day6.B.solve() == @test_answer_b5
  end

end
