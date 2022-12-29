defmodule Advent2022.Day5 do
  def real_data do
    File.read!("priv/day5.txt")
    |> Advent2022.Util.parse_strings()
  end

  def test_data do
    """
        [D]    
    [N] [C]    
    [Z] [M] [P]
     1   2   3 
    
    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2\
    """
  end

  @doc "step1() can only be called with blank stacks []. It will initalize the right number of empty stacks and call step()."
  def step1(lines = [next_line | _], []) do
    step(
      lines,
      Regex.scan(~r/((\[(?<crate>\w)\]|   ) ?)/, next_line, capture: :all_names)
      |> IO.inspect(label: "stack width")
      |> Enum.map(fn _ -> [] end)
    )
  end

  def step([next_line | lines], stacks) do
    cond do
      match?(^next_line, "") -> step(lines, stacks)

      # Done with init. Flip each stack upside down.
      Regex.match?(~r/^(\s?\d+\s+)+$/, next_line) ->
        step(lines, stacks |> trim_empty_crates() |> Enum.map(&Enum.reverse(&1) ))

      # After init, crates are added and removed from the tops of stacks.
      move = Regex.run(~r/move (\d+) from (\d) to (\d)/, next_line) ->
        step(
          lines, 
          move_crates(
            Enum.at(move, 1) |> String.to_integer(),
            (Enum.at(move, 2) |> String.to_integer()) - 1,
            (Enum.at(move, 3) |> String.to_integer()) - 1,
            stacks
          )
        )
        
      # During init, crates get added to the bottom of stacks.
      crates = Regex.scan(~r/((\[(?<crate>\w)\]|   ) ?)/, next_line, capture: :all_names) -> 
        step(lines, crates |> push_crates(stacks))

    end
  end

  # output
  def step([], stacks) do
    stacks
    |> Enum.map(&hd(&1))
    |> Enum.join("")
  end

  def move_crates(0, _, _, stacks), do: stacks |> IO.inspect(label: "after")

  def move_crates(amount, source, dest, stacks) do
    move_crates(
      amount - 1,
      source,
      dest, 
      stacks
      |> Enum.at(source)
      |> Enum.split(1)
      |> fn {top, bottom} ->
        stacks |> List.replace_at(source, bottom) |> List.replace_at(dest, top ++ Enum.at(stacks, dest))
      end.()
    )
  end


  def push_crates(crates, stacks) do
    Enum.zip(crates, stacks)
    |> Enum.map(fn {crate, stack} -> [crate | stack] end)
  end

  def trim_empty_crates(stacks) do
    stacks
    |> Enum.map(
      fn stack -> 
        stack
        |> Enum.filter(
          fn [""] -> false
            _ -> true
          end
        )
      end
    )
    |> IO.inspect(label: "trimmed")
  end

  defmodule A do

    def solve(data) do
      Advent2022.Day5.step1(data, [])
    end

  end

  defmodule B do

    def solve(data) do
    end

  end
end
