defmodule Advent2022.Day21 do
    require Decimal

    def real_data do
      File.read!("priv/day21.txt")
      |> Advent2022.Util.parse_strings()
    end

    def build_operations(operation_map \\ %{}, operations_list) 

    def build_operations(operation_map, [[name | operation] | rest]) do
        operation_map
        |> Map.merge(%{"#{name}" => operation} |> IO.inspect())
        |> build_operations(rest)
    end

    def build_operations(all, []), do: all

    def run_operation(operation_map, name) do
        operation_map
        |> Map.get(name)
        |> evaluate_operation(operation_map)
    end

    def evaluate_operation([number], _), do: Decimal.new(number)
    def evaluate_operation([a, "+", b], operation_map), do: Decimal.add(run_operation(operation_map, a), run_operation(operation_map, b))
    def evaluate_operation([a, "-", b], operation_map), do: Decimal.sub(run_operation(operation_map, a), run_operation(operation_map, b))
    def evaluate_operation([a, "*", b], operation_map), do: Decimal.mult(run_operation(operation_map, a), run_operation(operation_map, b))
    def evaluate_operation([a, "/", b], operation_map), do: Decimal.div(run_operation(operation_map, a), run_operation(operation_map, b))
  
    defmodule A do
  
      def solve(data) do
        data
        |> Enum.map(&String.split(&1, ~r/ |:/, trim: true))
        |> Advent2022.Day21.build_operations()
        |> Advent2022.Day21.run_operation("root")
        
      end
  
    end
  
    defmodule B do
    
        def solve(data) do

        end
  
    end
  end
  