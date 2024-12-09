defmodule Adventofcode24.DayFour do
  alias Adventofcode24.Helpers

  def run() do
    grid =
      Helpers.read_file("day4.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.graphemes/1)

    find_all_xmas(grid)
    |> length()
    |> IO.inspect()

    find_all_x_mas(grid)
    |> length()
    |> IO.inspect()
  end

  def find_all_xmas(grid) do
    rows = length(grid)
    cols = length(hd(grid))

    for r <- 0..(rows - 1),
        c <- 0..(cols - 1),
        # directions to check
        direction <- [{0, 1}, {1, 0}, {1, 1}, {-1, 1}, {0, -1}, {-1, 0}, {-1, -1}, {1, -1}],
        matches_xmas?(grid, {r, c}, direction),
        into: [],
        do: {{r, c}, direction}
  end

  def matches_xmas?(grid, {row, col}, {dr, dc}) do
    pattern = ["X", "M", "A", "S"]

    Enum.reduce_while(0..3, true, fn i, _acc ->
      r = row + i * dr
      c = col + i * dc

      cond do
        !valid_position?(grid, r, c) -> {:halt, false}
        get_in(grid, [Access.at(r), Access.at(c)]) != Enum.at(pattern, i) -> {:halt, false}
        true -> {:cont, true}
      end
    end)
  end

  def find_all_x_mas(grid) do
    rows = length(grid)
    cols = length(hd(grid))

    result = for r <- 0..(rows - 1),
        c <- 0..(cols - 1),
        # directions to check
        # direction <- [{-1, -1}, {-1, 1}, {1, -1}, {1, 1}],
        hit = matches_x_mas?(grid, {r, c}),
        into: [],
        do: hit

    result
    |> Enum.filter(& &1 != 0)
  end

  def matches_x_mas?(grid, {row, col}) do
    if get_in(grid, [Access.at(row), Access.at(col)]) != "A" do
      0
    else

    if valid_position?(grid, row - 1, col - 1) && valid_position?(grid, row + 1, col - 1) &&
       valid_position?(grid, row - 1, col + 1) && valid_position?(grid, row + 1, col + 1) do
      cond do
        get_in(grid, [Access.at(row - 1), Access.at(col - 1)]) == "M" &&
        get_in(grid, [Access.at(row + 1), Access.at(col - 1)]) == "M" &&
        get_in(grid, [Access.at(row - 1), Access.at(col + 1)]) == "S" &&
        get_in(grid, [Access.at(row + 1), Access.at(col + 1)]) == "S" ->
        1

        get_in(grid, [Access.at(row - 1), Access.at(col - 1)]) == "S" &&
        get_in(grid, [Access.at(row + 1), Access.at(col - 1)]) == "S" &&
        get_in(grid, [Access.at(row - 1), Access.at(col + 1)]) == "M" &&
        get_in(grid, [Access.at(row + 1), Access.at(col + 1)]) == "M" ->
        1

        get_in(grid, [Access.at(row - 1), Access.at(col - 1)]) == "M" &&
        get_in(grid, [Access.at(row + 1), Access.at(col - 1)]) == "S" &&
        get_in(grid, [Access.at(row - 1), Access.at(col + 1)]) == "M" &&
        get_in(grid, [Access.at(row + 1), Access.at(col + 1)]) == "S" ->
        1

        get_in(grid, [Access.at(row - 1), Access.at(col - 1)]) == "S" &&
        get_in(grid, [Access.at(row + 1), Access.at(col - 1)]) == "M" &&
        get_in(grid, [Access.at(row - 1), Access.at(col + 1)]) == "S" &&
        get_in(grid, [Access.at(row + 1), Access.at(col + 1)]) == "M" ->
        1

        true ->
          0
      end
    end
    end
  end

  def valid_position?(grid, row, col) do
    rows = length(grid)
    cols = length(hd(grid))
    row >= 0 && row < rows && col >= 0 && col < cols
  end
end
