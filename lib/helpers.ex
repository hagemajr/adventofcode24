defmodule Adventofcode24.Helpers do
  @data_path Path.expand("data", File.cwd!())

  def read_lines(filename) do
    @data_path
      |> Path.join(filename)
      |> File.read!()
      |> String.split("\n")
  end

  def read_file(filename) do
    @data_path
      |> Path.join(filename)
      |> File.read!()
  end

  def prime?(n) when n <= 1, do: false
  def prime?(2), do: true
  def prime?(n) when rem(n, 2) == 0, do: false
  def prime?(n) do
    max_divisor = :math.sqrt(n) |> floor()
    Enum.all?(3..max_divisor//2, fn x -> rem(n, x) != 0 end)
  end
end
