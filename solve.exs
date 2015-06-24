#!/usr/bin/env elixir

target = ReadInput.gets_to_i
count = ReadInput.gets_to_i
values = ReadInput.read_value([], count)
# IO.inspect values
Solve.solve(values, target)
