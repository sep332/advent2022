defmodule Advent2022.Day10 do
    def real_data do
      File.read!("priv/day10.txt")
      |> Advent2022.Util.parse_strings()
    end

  
    defmodule A do
  
      def solve(data) do
        {_, _, answer} =
        data
        |> Enum.map(&String.split/1)
        |> Enum.map(
            fn ["addx", increment] -> {2, String.to_integer(increment)}
               ["noop"] -> {1, 0}
            end
        )
        |> Enum.reduce({0, 1, 0},
          fn {time_delta, increment}, {time, register, wanted_sum} ->
            new_time = time + time_delta

            Range.new(time, new_time-1)
            |> MapSet.new()
            |> MapSet.intersection(Range.new(19, new_time, 40) |> MapSet.new())
            |> MapSet.to_list()
            |> case do
                [] -> {new_time, register + increment, wanted_sum}
                [target_time] -> {new_time, register + increment, wanted_sum + ((register) * (target_time+1))}
            end
          end
        )
        
        answer
      end
  
    end
  
    defmodule B do

        def step({instr, incr}, acc) when is_binary(incr) do
            step({instr, String.to_integer(incr)}, acc)
        end

        def step({instr, incr}, {time, register, screen, []}) do
            step({instr, incr}, {time, register, screen, [{"stop", 0}]})
        end

      def step({"addx", increment}, {time, register, screen, input}) do
        new_screen = screen <> new_screen_delta(time, register)
        
        step({"add2", increment}, {time+1, register, new_screen, input})
      end

      def step({"add2", increment}, {time, register, screen, [{instr, incr} | rest]}) do
        new_screen = screen <> new_screen_delta(time, register)

        step({instr, incr}, {time+1, register+increment, new_screen, rest})
      end

      def step({"noop", _}, {time, register, screen, [{instr, incr} | rest]}) do
        new_screen = screen <> new_screen_delta(time, register)

        step({instr, incr}, {time+1, register, new_screen, rest})
      end

      def step({"stop", _}, {_, _, screen, _}) do
        screen
      end

      def new_screen_delta(time, register) do
        column = rem(time, 40)

        maybe_newline = 
        case column == 39 do
            true -> "\n"
            false -> ""
        end
        case register == column || register == column - 1 || register == column + 1 do
            true -> "#" <> maybe_newline
            _ -> "." <> maybe_newline
        end
      end
  
      def solve(data) do
        [head | rest] =
        data
        |> Enum.map(&String.split/1)
        |> Enum.map(
            fn ["addx", increment] -> {"addx", String.to_integer(increment)}
               ["noop"] -> {"noop", 0}
            end
        )

        step(head, {0, 1, "", rest})

      end
  
    end
  end
  