defmodule MbtaDeparturesBoard.DeparturesController do
  use MbtaDeparturesBoard.Web, :controller
  use HTTPotion.Base

  def index(conn, _params) do
    url = "http://developer.mbta.com/lib/gtrtfs/Departures.csv"

    HTTPotion.start

    response = HTTPotion.get(url)

    data = response.body
    |> CSVLixir.parse
    |> List.delete_at(0) # Remove the first item, they're headers

    conn
    |> assign(:data,  data)
    |> render "index.html"
  end

end
