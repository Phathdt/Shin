defmodule ShinAdminWeb.PageController do
  use ShinAdminWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
