defmodule DiscussWeb.ProductController do
  use DiscussWeb, :controller

  alias Discuss.Discussions
  alias Discuss.Discussions.Product

  import Ecto.Query, warn: false
  alias Discuss.Repo

  plug DiscussWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    products = Repo.all(Product)
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Discussions.change_product(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product}) do
    changeset = Product.changeset(%Product{}, product)

    case Repo.insert(changeset) do
      {:ok, _product} ->
        conn
        |> put_flash(:info, "Product Created")
        |> redirect(to: Routes.product_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Discussions.get_product!(id)
    render(conn, "show.html", product: product)
  end

  def edit(conn, %{"id" => product_id}) do
    product = Repo.get(Product, product_id)
    changeset = Discussions.change_product(product)
    render(conn, "edit.html", changeset: changeset, product: product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Discussions.get_product!(id)

    case Discussions.update_product(product, product_params) do
      {:ok, _product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: Routes.product_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Discussions.get_product!(id)
    {:ok, _product} = Discussions.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: Routes.product_path(conn, :index))
  end
end
