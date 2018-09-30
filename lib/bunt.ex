defmodule Bunt do
  alias Bunt.ANSI

  @version Mix.Project.config()[:version]

  def puts(value \\ "", color \\ :gold) do
    result =
      if !!color do
        [color, value]
      else
        value
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
