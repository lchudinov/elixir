defmodule Streams do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.map(&String.length/1)
  end

  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.map(&String.length/1)
    |> Enum.max
  end

  def longest_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.max_by(fn line -> String.length(line) end)
  end

  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.map(fn line -> length(String.split(line)) end)
  end
end

IO.inspect(Streams.lines_lengths!("streams.exs"))
IO.inspect(Streams.longest_line_length!("streams.exs"))
IO.inspect(Streams.longest_line!("streams.exs"))
IO.inspect(Streams.words_per_line!("streams.exs"))
