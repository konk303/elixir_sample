defmodule SolveWithTuple do
  def solve(values, needs) do
    sorted = Enum.sort(values) |> List.to_tuple
    # IO.inspect sorted

    IO.puts Enum.reduce(do_solve(sorted, needs), 0, fn(pid, a) ->
      # IO.inspect pid
      receive do
        { ^pid, result } -> a + result
      end
    end)
  end

  defp do_solve(sorted, needs) do
    Enum.reduce(0..(tuple_size(sorted) - 3), [], fn(i, a) ->
      # IO.inspect i
      needs_for_second = needs - elem(sorted, i)
      me = self()
      # IO.inspect test_second(sorted, i + 1, needs_for_second)
      pid = spawn_link fn -> send(me, { self, test_second(sorted, i + 1, needs_for_second, 0) }) end
      [pid | a]
    end)
  end

  defp test_second(sorted, idx, _, counts) when idx >= (tuple_size(sorted) - 1), do: counts
  defp test_second(sorted, idx, needs, counts) do
    second = elem(sorted, idx)
    third = needs - second
    case third do
      x when x <= second -> counts
      x -> test_second(sorted, idx + 1, needs, counts + test_third(sorted, idx + 1, x))
    end
  end

  defp test_third(sorted, idx, _) when idx >= tuple_size(sorted), do: 0
  defp test_third(sorted, idx, need) do
    third = elem(sorted, idx)
    # IO.inspect [idx, third, need]
    case third do
      x when x > need -> 0
      x when x == need -> 1
      _ -> test_third(sorted, idx + 1, need)
    end
  end
end
