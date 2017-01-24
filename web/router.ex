defmodule MbtaDeparturesBoard.Router do
  use MbtaDeparturesBoard.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MbtaDeparturesBoard do
    pipe_through :browser # Use the default browser stack

    get "/", DeparturesController, :index
    get "/departures", DeparturesController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MbtaDeparturesBoard do
  #   pipe_through :api
  # end
end
