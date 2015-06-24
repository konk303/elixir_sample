defmodule ReadInput do
  def gets_to_i do
    IO.gets("") |> String.strip |> String.to_integer
  end

  def read_value(values, n) when n <= 0, do: values
  def read_value(values, n) do
    read_value([gets_to_i | values], n - 1)
  end
end

defmodule Solve do
  def solve(values, target) do
    IO.puts solve_each(values, target, 0)
  end

  def solve_each([], _, matched), do: matched
  def solve_each([head|tail], target, matched) do
    # IO.inspect head
    # IO.inspect tail
    # IO.inspect matched_count(tail, target - head, 0)
    # IO.inspect matched
    # IO.inspect target
    solve_each(tail, target, matched + matched_count(tail, target - head, 0))
  end

  def matched_count([], _, result), do: result
  def matched_count([head|tail], needs, result) do
    matched_count tail, needs,
    result + Enum.count(tail, &(head + &1 == needs))
  end
end
