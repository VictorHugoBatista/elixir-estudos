defmodule Recursor do
    def show([head | tail]) do
        IO.puts head
        __MODULE__.show(tail)
    end
    def show([]) do
    end

    def sum(numbers) do
        __MODULE__.sum(numbers, 0)
    end
    def sum([head | tail], sum) do
        __MODULE__.sum(tail, sum + head)
    end
    def sum([], sum) do
        sum
    end
end

Recursor.show([1, 2, 5, 8, 9, 10, 13, 16, 20, 35, 67])
IO.puts Recursor.sum([1, 2, 3])
