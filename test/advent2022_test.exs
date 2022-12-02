defmodule Advent2022Test do
  use ExUnit.Case
  doctest Advent2022


  test "Day 1 A" do
    assert Advent2022.Day1.test_data |> Advent2022.Day1.A.solve == Advent2022.Day1.A.test_answer
  end

  test "Day 1 B" do
    assert Advent2022.Day1.test_data |> Advent2022.Day1.B.solve == Advent2022.Day1.B.test_answer
  end

  # test "Day 2 A" do
  #   assert Advent2022.Day2.test_data |> Advent2022.Day2.A.solve == Advent2022.Day2.A.test_answer
  # end

  # test "Day 2 B" do
  #   assert Advent2022.Day2.test_data |> Advent2022.Day2.B.solve == Advent2022.Day2.B.test_answer
  # end

  # test "Day 3 A" do
  #   assert Advent2022.Day3.test_data |> Advent2022.Day3.A.solve == Advent2022.Day3.A.test_answer
  # end

  # test "Day 3 B" do
  #   assert Advent2022.Day3.test_data |> Advent2022.Day3.B.solve == Advent2022.Day3.B.test_answer
  # end

  # test "Day 4 A" do
  #   assert Advent2022.Day4.test_data |> Advent2022.Day4.A.solve == Advent2022.Day4.A.test_answer
  # end
end
