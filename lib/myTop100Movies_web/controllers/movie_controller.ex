defmodule MyTop100MoviesWeb.MovieController do
  use MyTop100MoviesWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> render("index.html")
  end

  def create(conn, %{"id" => id, "name" => name} = movie) do

    render(conn, "new.html", movie)
  end
end
