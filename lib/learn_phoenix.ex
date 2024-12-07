defmodule LearnPhoenix do
  @moduledoc """
  LearnPhoenix keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # Here our `@spec` says the function's return type is an string:
  @spec my_cool_func(integer(), integer()) :: String.t()
  def my_cool_func(an_integer, another_interger) do
    new_integer = an_integer + 1 + another_interger

    # But the function is actually returning a string!
    Integer.to_string(new_integer)
  end
end
