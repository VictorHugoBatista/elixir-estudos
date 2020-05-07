defmodule Enuns do
  # Cria uma função que soma todos os itens de uma lista chave-valor.
  # O parâmetro keysToSum é uma lista de atoms que serão somados no array chave-valor.
  def makeSumValues(keysToSum) do
    fn values -> Enum.reduce(keysToSum, 0, fn (keyToSum, currentSum) -> currentSum + (values[keyToSum] || 0) end) end
  end

  # Incrementa todos os itens de uma lista chave - valor em um mantendo as chaves.
  def incrementAllValues(values) do
    # mapMantainKeys(values, fn (value) -> value + 1 end)
    mapMantainKeys(values, &(&1 + 1))
  end

  defp mapMantainKeys(list, function) do
    Enum.map(list, fn(item) -> {elem(item, 0), function.(elem(item, 1))} end)
  end
end

# IO.inspect(Enuns.sumThreeValues([a: 6, b: 8, c: 4]))
[a: 6, b: 8, c: 4] |> Enuns.incrementAllValues |> IO.inspect

[a: 6] |> Enuns.incrementAllValues |> IO.inspect

# Soma apenas os itens :a e :b da lista.
sumAB = Enuns.makeSumValues([:a, :b])
sumAB.([a: 6, b: 8, c: 1000]) |> IO.puts
