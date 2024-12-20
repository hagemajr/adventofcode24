defmodule Adventofcode24 do
  @moduledoc """
  Documentation for `Adventofcode24`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Adventofcode24.hello()
      :world

  """
  alias Adventofcode24.DayOne
  alias Adventofcode24.DayTwo
  alias Adventofcode24.DayThree
  alias Adventofcode24.DayFour

  def run() do
    IO.puts("~~~Day 1~~~")
    DayOne.run()
    DayOne.run2()
    IO.puts("\n")
    IO.puts("~~~Day 2~~~")
    DayTwo.run()
    IO.puts("\n")
    IO.puts("~~~Day 3~~~")
    DayThree.run()
    DayThree.run2()
    IO.puts("\n")
    IO.puts("~~~Day 4~~~")
    DayFour.run()
    IO.puts("\n")
  end
end

Adventofcode24.run()
