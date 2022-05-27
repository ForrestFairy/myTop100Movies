defmodule MyTop100MoviesWeb.MovieControllerTest do
  use MyTop100MoviesWeb.ConnCase

  # alias MyTop100Movies.Movie

  @create_attrs %{number: 5, name: "Dune"}
  @invalid_attrs %{number: nil}

  test "GET /movies", %{conn: conn} do
    conn = get(conn, Routes.movie_path(conn, :index))
    assert html_response(conn, 200) =~ "Where are my movies?"
  end

  describe "creating movies" do
    test "correct POST /movies", %{conn: conn} do
      conn = post(conn, Routes.movie_path(conn, :create), movie: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.movie_path(conn, :show, id)
    end

    # test "invalid POST /movies", %{conn: conn} do
    #   conn = post(conn, Routes.movie_path(conn, :create), movie: @invalid_attrs)
    #   assert html_response(conn, 200) =~ "New Movie"
    # end
  end

end
