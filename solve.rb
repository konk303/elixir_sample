#!/usr/bin/env ruby

require 'set'

target = gets.to_i
count = gets.to_i
values = []
count.times do |i|
  values << gets.to_i
end

answer = 0
values_a = values.sort
values = values.to_set

values_a.each_with_index do |vi, i|
  values_a[i.succ, count].each do |vj|
    need = target - vi - vj
    # sortしてるので、`3つめより2つめが大きいか同じ == これ以上先に進んでも満たせる可能性がない`
    break if vj >= need
    answer = answer.succ if values.member? need
  end
end
puts answer
