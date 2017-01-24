# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mbta_departures_board,
  ecto_repos: [MbtaDeparturesBoard.Repo]

# Configures the endpoint
config :mbta_departures_board, MbtaDeparturesBoard.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cfe3H9N4zE0RxLSk/em3o8aU7vv3dhn+LDInqzParuZLFvp8eJ5KStx2KK2Y5i/G",
  render_errors: [view: MbtaDeparturesBoard.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MbtaDeparturesBoard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
