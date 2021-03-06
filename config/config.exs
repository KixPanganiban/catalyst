# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :catalyst,
  ecto_repos: [Catalyst.Repo]

# Configures the endpoint
config :catalyst, Catalyst.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o4OZBEo5Vbvg9lQ72fONLZIUkgn15DowVDi/VXdX5kuxplhI1Upjvvp5fu1bjW6B",
  render_errors: [view: Catalyst.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Catalyst.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
