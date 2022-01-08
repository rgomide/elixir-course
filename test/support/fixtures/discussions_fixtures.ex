defmodule Discuss.DiscussionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.Discussions` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Discuss.Discussions.create_product()

    product
  end
end
