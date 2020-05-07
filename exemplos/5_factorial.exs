defmodule MyMath do
    def factorial(1) do 1 end
    def factorial(number) do
        number * __MODULE__.factorial(number - 1)
    end
end

MyMath.factorial(9) |> IO.puts