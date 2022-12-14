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

        def step(time, register, screen, [{instr, incr} | rest]) when is_binary(incr) do
            step(time, register, screen, [{instr, String.to_integer(incr)} | rest])
        end

        def step(_, _, screen, []) do
            screen
        end

        def step(time, register, screen, [{"addx", incr} | rest]) do
            new_screen = screen <> new_screen_delta(time, register)
            
            step(time+1, register, new_screen, [{"add2", incr} | rest])
        end

        def step(time, register, screen, [{"add2", incr} | rest]) do
            new_screen = screen <> new_screen_delta(time, register)

            step(time+1, register+incr, new_screen, rest)
        end

        def step(time, register, screen, [{"noop"} | rest]) do
            new_screen = screen <> new_screen_delta(time, register)

            step(time+1, register, new_screen, rest)
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
            step(
                0,
                1,
                "", 
                data
                |> Enum.map(&String.split/1)
                |> Enum.map(&List.to_tuple/1)
            )

        end
  
    end
  end
  