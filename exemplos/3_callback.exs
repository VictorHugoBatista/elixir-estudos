defmodule Product do
    def calculate_taxes(raw_price, tax_func) do
        tax_func.(raw_price)
    end

    def cpf_taxes(raw_price) do
        raw_price * 2
    end

    def cnpj_taxes(raw_price) do
        raw_price * 3
    end
end

cpf_taxes = &(&1 * 2)
cnpj_taxes = fn(raw_value) -> raw_value * 3 end

Product.calculate_taxes(300, cpf_taxes) |> IO.puts
Product.calculate_taxes(300, cnpj_taxes) |> IO.puts

Product.calculate_taxes(300, &Product.cpf_taxes/1) |> IO.puts
Product.calculate_taxes(300, &Product.cnpj_taxes/1) |> IO.puts
