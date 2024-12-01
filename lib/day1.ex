defmodule Adventofcode24.DayOne do
  @data_path Path.expand("data", File.cwd!())

  def run() do
    {first, second} =
      @data_path
      |> Path.join("day1.txt")
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(&String.split(&1, "   "))
      |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
      |> Enum.unzip()

    first_sorted = Enum.sort(first, :asc)
    second_sorted = Enum.sort(second, :asc)

    Enum.to_list(0..(length(first_sorted) - 1))
    |> Enum.map(fn x -> abs(Enum.at(first_sorted, x) - Enum.at(second_sorted, x)) end)
    |> Enum.sum()
  end

  def run2() do
    {first, second} =
      @data_path
      |> Path.join("day1.txt")
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(&String.split(&1, "   "))
      |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
      |> Enum.unzip()

    first_sorted = Enum.sort(first, :asc)
    second_sorted = Enum.sort(second, :asc)

    first_sorted
    |> Enum.map(fn x -> Enum.filter(second_sorted, fn y -> y == x end) |> length() |> Kernel.*(x) end)
    |> Enum.sum()
  end
end
