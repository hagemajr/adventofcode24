defmodule Adventofcode24.DayTwo do

  alias Adventofcode24.Helpers

  def run() do
    reports = Helpers.read_lines("day2.txt")

    first_pass_results = for report <- reports, do: handle(report)
    first_pass_results = Enum.filter(first_pass_results, fn x -> x != nil end)
    total = length(reports)
    first_pass_total = length(first_pass_results)
    IO.inspect(total - first_pass_total)
    second_pass_results = for report <- first_pass_results, do: handle_rest(report)
    second_pass_results = Enum.filter(second_pass_results, fn x -> x != nil end)
    second_pass_total = length(second_pass_results)
    IO.inspect(total - second_pass_total)
  end

  def handle(report) do
    items = String.split(report, " ") |> Enum.map(fn(x) -> String.to_integer(x) end)
    inc_results = increasing(hd(items), tl(items), 0)
    dec_results = decreasing(hd(items), tl(items), 0)

    if inc_results == false and dec_results == false do
      items
    else
      nil
    end
  end

  def handle_rest(report) do
    results = 0..(length(report) - 1)
      |> Enum.map(fn index ->
        List.delete_at(report, index)
      end)
      |> Enum.map(fn(x) ->
        inc = increasing(hd(x), tl(x), 0)
        dec = decreasing(hd(x), tl(x), 0)
        if inc == false and dec == false do
          false
        else
          true
        end
      end)
    |> Enum.filter(fn(x) -> x == true end)
    |> length()
    if results > 0, do: nil, else: report
  end

  def increasing(_val, [] = _list, acc) do
    if acc ==  0 do
      true
    else
      false
    end
  end

  def increasing(val, list, acc) do
    [next | rest] = list
    if abs(val - next) >=1 and abs(val - next) <= 3 do
      if val < next do
        increasing(next, rest, acc)
      else
        increasing(val, [], 1)
      end
    else
      increasing(val, [], 1)
    end
  end

  def decreasing(_val, [] = _list, acc) do
    if acc ==  0 do
      true
    else
      false
    end
  end

  def decreasing(val, list, acc) do
    [next | rest] = list
    if abs(val - next) >=1 and abs(val - next) <= 3 do
      if val > next do
        decreasing(next, rest, acc)
      else
        decreasing(val, [], 1)
      end
    else
      decreasing(val, [], 1)
    end
  end
end
