defmodule CivicsExamApiWeb.PageController do
  use CivicsExamApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
