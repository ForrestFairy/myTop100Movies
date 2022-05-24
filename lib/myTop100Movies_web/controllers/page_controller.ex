defmodule MyTop100MoviesWeb.PageController do
  use MyTop100MoviesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
