defmodule Discuss.DiscussionsTest do
  use Discuss.DataCase

  alias Discuss.Discussions

  @moduletag :discussions_test

  describe "products" do
    alias Discuss.Discussions.Product

    import Discuss.DiscussionsFixtures

    @invalid_attrs %{title: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Discussions.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Discussions.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Product{} = product} = Discussions.create_product(valid_attrs)
      assert product.title == "some title"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Discussions.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Product{} = product} = Discussions.update_product(product, update_attrs)
      assert product.title == "some updated title"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Discussions.update_product(product, @invalid_attrs)
      assert product == Discussions.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Discussions.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Discussions.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Discussions.change_product(product)
    end
  end
end
