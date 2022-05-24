defmodule MyTop100Movies.Repo.Migrations.Movies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :number, :integer, primary_key: true
      add :name, :string
    end
  end
end
