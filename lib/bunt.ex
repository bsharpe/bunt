defmodule Bunt do
  alias Bunt.ANSI

  @version Mix.Project.config()[:version]

  def puts(value \\ "", color \\ nil) do
    result = nil

    if !!color do
      result = [value, color]
    else
      result = value
    end

    result
    |> format
    |> IO.puts()
  end

  def warn(value \\ "") do
    formatted_value = format(value)
    IO.puts(:stderr, formatted_value)
  end

  def write(value \\ "") do
    value
    |> format
    |> IO.write()
  end

  def format, do: format("")
  def format(nil), do: format("")
  def format(text) when is_binary(text), do: text

  def format(list) when is_list(list) do
    list
    |> List.flatten()
    |> ANSI.format()
  end

  def version, do: @version
end
