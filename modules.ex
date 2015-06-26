defmodule ReadInput do
  def gets_to_i do
    IO.gets("") |> String.strip |> String.to_integer
  end

  def read_values(count) do
    Enum.map(1..count, fn(_) -> gets_to_i end)
  end
end

defmodule Solve do
  def solve(values, needs) do
    sorted = Enum.sort(values)

    proc_count = do_solve(sorted, needs, 0)
    IO.puts Enum.reduce(1..proc_count, 0, fn(_, a) ->
      # IO.inspect pid
      receive do
        { _, result } -> a + result
      end
    end)
  end

  defp do_solve([_, _], _, count), do: count
  defp do_solve([first|tail], needs, count) do
    # IO.inspect first
    me = self()
    spawn_link fn -> send(me, { self, test_second(tail, needs - first, 0) }) end
    do_solve tail, needs, count + 1
  end

  defp test_second([], _, matcheds), do: matcheds
  defp test_second([second|tail], needs, matcheds) do
    test_second(tail, needs, matcheds + test_third(tail, needs - second))
  end

  defp test_third([], _), do: 0
  defp test_third([third|_], need) when (third > need), do: 0
  defp test_third([third|_], need) when (third == need), do: 1
  defp test_third([_|tail], need), do: test_third(tail, need)
end
