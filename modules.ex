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

    IO.puts Enum.reduce(do_solve(sorted, needs, []), 0, fn(pid, a) ->
      # IO.inspect pid
      receive do
        { ^pid, result } -> a + result
      end
    end)
  end

  defp do_solve([_, _], _, pids), do: pids
  defp do_solve([first|tail], needs, pids) do
    # IO.inspect first
    me = self()
    pid = spawn_link fn -> send(me, { self, test_second(tail, needs - first, 0) }) end
    do_solve tail, needs, [pid | pids]
  end

  defp test_second([_], _, matcheds), do: matcheds
  defp test_second([second|tail], needs, matcheds) do
    third = needs - second
    case third do
      x when x <= second -> matcheds
      x -> test_second(tail, needs, matcheds + test_third(tail, x))
    end
  end

  defp test_third([], _), do: 0
  defp test_third([third|_], need) when (third >= need) do
    case third do
      x when x > need -> 0
      x when x == need -> 1
    end
  end
  defp test_third([_|tail], need), do: test_third(tail, need)
end
