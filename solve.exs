#!/usr/bin/env elixir

defmodule ReadInput do
  def gets_to_i do
    IO.gets("") |> String.strip |> String.to_integer
  end

  def read_value(values, n) when n <= 0, do: values
  def read_value(values, n) do
    read_value([gets_to_i | values], n - 1)
  end
end

defmodule Calc do
  def solve(values, target) do
    IO.inspect solve_each(values, 0, target)
  end

  def solve_each([], matched, _), do: matched
  def solve_each([head|tail], matched, target) do
    matched = Enum.reduce(sums(tail, head, []), matched,
      fn(i, a) -> if i == target, do: a + 1, else: a end)
    IO.inspect head
    # IO.inspect tail
    # IO.inspect sums(tail, head, [])
    # IO.inspect matched
    # IO.inspect target
    solve_each(tail, matched, target)
  end

  def sums([], _, result), do: result
  def sums([head|tail], v1, result) do
    sums tail, v1, Enum.map(tail, &(v1 + head + &1)) ++ result
  end
end

target = ReadInput.gets_to_i
count = ReadInput.gets_to_i
values = ReadInput.read_value([], count)
# IO.inspect values
Calc.solve(values, target)
