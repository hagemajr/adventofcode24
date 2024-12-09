defmodule Adventofcode24.DayThree do
  alias Adventofcode24.Helpers

  def run() do
    data = Helpers.read_file("day3.txt")

    sum =
      Regex.scan(~r/mul\((\d+),(\d+)\)/, data, capture: :all_but_first)
      |> Enum.map(fn [first | [second | _]] = _x ->
        String.to_integer(first) * String.to_integer(second)
      end)
      |> Enum.sum()

    IO.inspect(sum)
  end

  def run2() do
    data = Helpers.read_file("day3.txt")

    instructions =
      Regex.scan(~r/mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/, data)
      |> Enum.map(fn x -> hd(x) end)

    process_instructions(hd(instructions), tl(instructions), 0, true)
    |> IO.inspect()
  end

  def parse_product(instruction) do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, instruction, capture: :all_but_first)
    |> Enum.map(fn [first | [second | _]] = _x ->
      String.to_integer(first) * String.to_integer(second)
    end)
    |> Enum.sum()
  end

  def process_instructions(current, [] = _list, acc, enabled) do
    if current != "do()" and current != "don't()" and enabled == true do
      acc + parse_product(current)
    else
      acc
    end
  end

  def process_instructions("do()", list, acc, _enabled) do
    [next | rest] = list
    process_instructions(next, rest, acc, true)
  end

  def process_instructions("don't()", list, acc, _enabled) do
    [next | rest] = list
    process_instructions(next, rest, acc, false)
  end

  def process_instructions(current, list, acc, enabled) do
    [next | rest] = list

    if enabled == true do
      process_instructions(next, rest, acc + parse_product(current), enabled)
    else
      process_instructions(next, rest, acc, enabled)
    end
  end
end
