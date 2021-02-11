defmodule ShinWebWeb.PageController do
  use ShinWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
