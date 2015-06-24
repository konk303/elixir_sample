#!/usr/bin/env elixir

# elixir solve.exs < datas/data4.txt  1913.32s user 2.57s system 100% cpu 31:55.42 total
# 1571200
# elixir solve.exs < datas/data4.txt  3780.44s user 9.24s system 755% cpu 8:21.57 total
# 1571200
# elixir solve.exs < datas/data4.txt  872.66s user 2.88s system 745% cpu 1:57.49 total
# 1571200

target = ReadInput.gets_to_i
count = ReadInput.gets_to_i
values = ReadInput.read_values(count)
# IO.inspect values
Solve.solve(values, target)
