defmodule MyTop100MoviesWeb.MovieController do
  use MyTop100MoviesWeb, :controller

  alias MyTop100Movies.Movie

  def index(conn, _params) do
    movies = Movie.list_movies()
    conn
    |> put_status(:ok)
    |> render("index.html", movies: movies)
  end


  def create(conn, %{"movie" => movie}) do
    movie = Movie.changeset(%Movie{}, movie)
    case MyTop100Movies.Repo.insert(movie) do
      {:ok, movie} ->
        conn
        |> put_status(:found)
        |> redirect(to: Routes.movie_path(conn, :show, movie))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        # |> put_flash(:info, "wrong data")
        # |> put_status(:bad_request)
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{movie: movie}) do

    render(conn, "show.html", movie)
  end

end
