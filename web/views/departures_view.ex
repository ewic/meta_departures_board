defmodule MbtaDeparturesBoard.DeparturesView do
  use MbtaDeparturesBoard.Web, :view

  # Import convenience functions from controllers
  import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1,
                                        action_name: 1, controller_module: 1]

  def handler_info(conn) do
    "Request Handled By: #{controller_module conn}.#{action_name conn}"
  end

  # Takes the comma-seperated string that is a row on the board and extract the data we want from it.
  def get_data(data, field) do
    data = List.to_tuple(data)

    case field do
      "origin"          -> elem(data,1)
      "trip"            -> elem(data,2)
      "destination"     -> elem(data,3)
      "scheduled_time"  -> format_time(elem(data,4))
      "lateness"        -> lateness_to_minutes(elem(data,5))
      "track"           -> elem(data,6)
      "status"          -> elem(data,7)
      _                 -> field
    end
  end

  defp format_time(seconds) do
    datetime = seconds
    |> Integer.parse
    |> elem(0)
    |> :calendar.gregorian_seconds_to_datetime

    time = elem(datetime, 1)
    hours = elem(time, 0)
    minutes = elem(time, 1)

    if hours > 12 do
      hours = hours - 12
      hours = Integer.to_string(hours)
    else
      hours = Integer.to_string(hours)
    end

    minutes = 
      if minutes < 10 do
        "0" <> Integer.to_string(minutes)
      else
        Integer.to_string(minutes)
      end

    hours <> ":" <> minutes
  end

  defp lateness_to_minutes(seconds) do
    minutes = Kernel.div(elem(Integer.parse(seconds),0), 60)
    |> Integer.to_string

    minutes <> " mins"
  end

end
