defmodule Adventofcode24.DayOne do
  alias Adventofcode24.Helpers

  def run() do
    {first, second} =
      Helpers.read_lines("day1.txt")
      |> Enum.map(&String.split(&1, "   "))
      |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
      |> Enum.unzip()

    first_sorted = Enum.sort(first, :asc)
    second_sorted = Enum.sort(second, :asc)

    Enum.to_list(0..(length(first_sorted) - 1))
    |> Enum.map(fn x -> abs(Enum.at(first_sorted, x) - Enum.at(second_sorted, x)) end)
    |> Enum.sum()
    |> IO.inspect()
  end

  def run2() do
    {first, second} =
      Helpers.read_lines("day1.txt")
      |> Enum.map(&String.split(&1, "   "))
      |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
      |> Enum.unzip()

    first_sorted = Enum.sort(first, :asc)
    second_sorted = Enum.sort(second, :asc)

    first_sorted
    |> Enum.map(fn x ->
      Enum.filter(second_sorted, fn y -> y == x end) |> length() |> Kernel.*(x)
    end)
    |> Enum.sum()
    |> IO.inspect()
  end
end
