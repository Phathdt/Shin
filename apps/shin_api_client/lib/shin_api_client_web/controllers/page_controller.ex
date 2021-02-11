defmodule ShinApiClientWeb.PageController do
  use ShinApiClientWeb, :controller

  def ping(conn, _params) do
    json(conn, %{message: "pong..."})
  end
end
