defmodule Advent2022 do
  defmodule Day1 do
    def real_data do
      File.read!("day1.txt")
      |> String.split("\n")
      |> Enum.map(&integer_or_nil/1)
    end

    def test_data do
      """
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
      |> String.split("\n")
      |> Enum.map(&integer_or_nil/1)
    end

    def integer_or_nil("") do
      nil
    end
    def integer_or_nil(string) do
      string
      |> String.to_integer
    end

    
    @doc "If there is a blank line, start counting calories for a new elf"
    def add_or_append(_item = nil, elves) do
      [0 | elves]
    end

    def add_or_append(item, []) do
      [item]
    end

    def add_or_append(item, [latest_elf | elves]) do
      [latest_elf + item | elves]
    end

    defmodule A do

      def solve(data) do
        data
        |> Enum.reduce([], &Advent2022.Day1.add_or_append/2)
        |> Enum.sort
        |> Enum.reverse
        |> hd()
      end

      def test_answer do
        24000
      end
    end

    defmodule B do

      def solve(data) do
        [elf1, elf2, elf3 | _elves] = 
        data
        |> Enum.reduce([], &Advent2022.Day1.add_or_append/2)
        |> Enum.sort
        |> Enum.reverse
        
        elf1 + elf2 + elf3
      end

      def test_answer do
        45000
      end
    end
  end
end
