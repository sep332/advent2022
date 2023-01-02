defmodule Advent2022.Day5 do

  @move_functions %{
    a: &Advent2022.Day5.move_crates_a/4,
    b: &Advent2022.Day5.move_crates_b/4
  }

  def real_data do
    File.read!("priv/day5.txt")
    |> Advent2022.Util.parse_strings()
  end

  @doc "step1() can only be called with blank stacks []. It will initalize the right number of empty stacks and call step()."
  def step1(lines = [next_line | _], [], version) do
    step(
      lines,
      Regex.scan(~r/((\[(?<crate>\w)\]|   ) ?)/, next_line, capture: :all_names)
      |> Enum.map(fn _ -> [] end),
      version
    )
  end

  def step([next_line | lines], stacks, version) do
    cond do
      match?(^next_line, "") -> step(lines, stacks, version)

      # Done with init. Flip each stack upside down.
      Regex.match?(~r/^(\s?\d+\s+)+$/, next_line) ->
        step(lines, stacks |> trim_empty_crates() |> Enum.map(&Enum.reverse(&1)), version)

      # After init, crates are added and removed from the tops of stacks.
      move = Regex.run(~r/move (\d+) from (\d) to (\d)/, next_line) ->
        step(
          lines, 
          @move_functions[version].(
            Enum.at(move, 1) |> String.to_integer(),
            (Enum.at(move, 2) |> String.to_integer()) - 1,
            (Enum.at(move, 3) |> String.to_integer()) - 1,
            stacks
          ),
          version
        )
        
      # During init, crates get added to the bottom of stacks.
      crates = Regex.scan(~r/((\[(?<crate>\w)\]|   ) ?)/, next_line, capture: :all_names) -> 
        step(lines, crates |> push_crates(stacks), version)

    end
  end

  # output
  def step([], stacks, _version) do
    stacks
    |> Enum.map(&hd(&1))
    |> Enum.join("")
  end

  def move_crates_a(0, _, _, stacks), do: stacks

  def move_crates_a(amount, source, dest, stacks) do
    move_crates_a(
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

  def move_crates_b(0, _, _, stacks), do: stacks

  def move_crates_b(amount, source, dest, stacks) do
      stacks
      |> Enum.at(source)
      |> Enum.split(amount)
      |> fn {top, bottom} ->
        stacks |> List.replace_at(source, bottom) |> List.replace_at(dest, top ++ Enum.at(stacks, dest))
      end.()
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
  end

  defmodule A do

    def solve(data) do
      Advent2022.Day5.step1(data, [], :a)
    end

  end

  defmodule B do

    def solve(data) do
      Advent2022.Day5.step1(data, [], :b)
    end

  end
end
