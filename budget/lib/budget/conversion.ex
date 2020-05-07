# run_mix run -e "Budget.Conversion.from_euro_to_dollar(15) |> IO.puts"

defmodule Budget.Conversion do
  @exchangeapiurl 'https://api.exchangeratesapi.io/latest?base=USD'

  def from_euro_to_dollar(amount) do
    case HTTPoison.get(@exchangeapiurl) do
      {:ok, response} -> parse(response) |> convert(amount)
      {:error, %HTTPoison.Error{reason: reason}} -> IO.inspect reason
    end
  end

  defp parse(%{status_code: 200, body: json_response}) do
    Poison.decode(json_response)
  end

  defp convert({:ok, rates}, amount) do
    rate = find_euro(rates)
    Float.ceil(amount * rate, 2)
  end

  defp find_euro(%{"rates" => %{"EUR" => rate}}) do
    rate
  end
end
