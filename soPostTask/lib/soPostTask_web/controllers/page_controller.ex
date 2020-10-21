defmodule SoPostTaskWeb.PageController do
  use SoPostTaskWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
