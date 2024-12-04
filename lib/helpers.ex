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
end
