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

  def run() do
    DayOne.run()
    |> IO.puts()

    DayOne.run2()
    |> IO.puts()
  end
end

Adventofcode24.run()
