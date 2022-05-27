defmodule MyTop100Movies.Movie do
  use Ecto.Schema

  schema "movies" do
    field :number, :integer, primary_key: true
    field :name, :string
  end

  def changeset(movie, params \\ %{}) do
    movie
    |> Ecto.Changeset.cast(params, [:name, :number])
    |> Ecto.Changeset.validate_required([:name, :number])
  end

  def list_movies() do
    MyTop100Movies.Repo.all(MyTop100Movies.Movie)
  end
end
