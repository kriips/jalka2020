defmodule Jalka2020Web.PageController do
  use Jalka2020Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
