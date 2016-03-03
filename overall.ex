defmodule Overall do
  def product([]) do
    0
  end

  def product(list) do
    product(list, 1)
  end

  def product([], prev_product) do
    prev_product
  end

  def product(list, prev_product) do
    [h|t] = list
    product(t, h * prev_product)
  end
end
