defmodule MyTop100MoviesWeb.MovieControllerTest do
  use MyTop100MoviesWeb.ConnCase

  test "GET /movies", %{conn: conn} do
    conn = get(conn, "/movies")
    assert html_response(conn, 200) =~ "Where are my movies?"
  end

  test "POST /movies", %{conn: conn} do
    conn = post(conn, "/movies")
    assert html_response(conn, 201) =~ "Idk"
  end
end
