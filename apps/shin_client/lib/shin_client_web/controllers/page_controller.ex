defmodule ShinClientWeb.PageController do
  use ShinClientWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
