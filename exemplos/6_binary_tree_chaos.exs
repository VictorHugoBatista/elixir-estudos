tree = %{
    value: 7,
    left: %{
        value: 4,
        left: %{
            value: 1,
            left: nil,
            right: nil,
        },
        right: %{
            value: 5,
            left: nil,
            right: nil,
        },
    },
    right: %{
        value: 13,
        left: nil,
        right: %{
            value: 18,
            left: nil,
            right: nil,
        },
    },
}

defmodule BinaryTree do
    # Percorre árvore infixo
    def walk(nil) do end
    def walk(tree) do
        __MODULE__.walk(tree.left)
        IO.puts tree.value
        __MODULE__.walk(tree.right)
    end

    # ------------------------------------------------------------------------

    # Percorre árvore em linha
    def walkLined(tree) do
        __MODULE__.walkLinedShow(tree)
        __MODULE__.walkLinedGo(tree)
    end

    def walkLinedGo(nil) do end
    def walkLinedGo(tree) do
        __MODULE__.walkLinedShow(tree.left)
        __MODULE__.walkLinedShow(tree.right)
        __MODULE__.walkLinedGo(tree.left)
        __MODULE__.walkLinedGo(tree.right)
    end

    def walkLinedShow(nil) do end
    def walkLinedShow(tree) do
        IO.puts tree.value
    end

    # ------------------------------------------------------------------------

    # Soma todos os valores da árvore percorrendo prefixo
    def sum(nil) do 0 end
    def sum(tree) do
        tree.value +
        __MODULE__.sum(tree.left) +
        __MODULE__.sum(tree.right)
    end
end

BinaryTree.walk(tree)
IO.puts '-----------------------'
BinaryTree.walkLined(tree)
IO.puts '-----------------------'
BinaryTree.sum(tree) |> IO.puts
