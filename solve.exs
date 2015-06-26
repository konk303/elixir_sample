#!/usr/bin/env elixir

# 1571200
# elixir solve.exs < datas/data4.txt  1913.32s user 2.57s system 100% cpu 31:55.42 total
# 1571200
# elixir solve.exs < datas/data4.txt  3780.44s user 9.24s system 755% cpu 8:21.57 total
# 1571200
# elixir solve.exs < datas/data4.txt  872.66s user 2.88s system 745% cpu 1:57.49 total
# 1571200
# elixir solve.exs < datas/data4.txt  482.74s user 0.66s system 781% cpu 1:01.86 total
# 1571200
# elixir solve.exs < datas/data4.txt  292.71s user 0.58s system 768% cpu 38.158 total
# 1571200
# elixir solve.exs < datas/data4.txt  293.66s user 0.52s system 776% cpu 37.896 total

target = ReadInput.gets_to_i
count = ReadInput.gets_to_i
values = ReadInput.read_values(count)
# IO.inspect values
# SolveWithTuple.solve(values, target)
Solve.solve(values, target)
