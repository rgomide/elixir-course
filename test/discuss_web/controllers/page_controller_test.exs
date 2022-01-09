defmodule DiscussWeb.PageControllerTest do
  use DiscussWeb.ConnCase

  @moduletag :page_controller_test

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Dashboard"
  end
end
