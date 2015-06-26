defmodule ReadInput do
  def gets_to_i do
    IO.gets("") |> String.strip |> String.to_integer
  end

  def read_values(count) do
    Stream.map(1..count, fn(_) -> gets_to_i end)
  end
end

defmodule Solve do
  def solve(values, needs) do
    sorted = Enum.sort(values)
    map = Enum.reduce(sorted, %{}, &(Map.put &2, &1, nil))
    # IO.inspect(map)

    IO.puts do_solve(sorted, map, needs)
  end

  defp do_solve([_, _], map, _) do
    Enum.reduce(1..(Map.size(map) - 2), 0, fn(_, a) ->
      # IO.inspect a
      receive do
        { result } -> a + result
      end
    end)
  end
  defp do_solve([first|tail], map, needs) do
    # IO.inspect first
    me = self()
    spawn_link fn -> send(me, { test_second(tail, map, needs - first) }) end
    do_solve tail, map, needs
  end

  defp test_second(seconds, map, needs) do
    Enum.count(seconds, fn(second) ->
      third = needs - second
      case third do
        x when x <= second -> false
        x -> Map.has_key?(map, x)
      end
    end)
  end
end
