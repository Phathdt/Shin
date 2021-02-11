defmodule ShinApiAdminWeb.PageController do
  use ShinApiAdminWeb, :controller

  def ping(conn, _params) do
    json(conn, %{message: "pong..."})
  end
end
