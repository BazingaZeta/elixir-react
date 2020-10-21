# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :soPostTask,
  ecto_repos: [SoPostTask.Repo]

# Configures the endpoint
config :soPostTask, SoPostTaskWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L1HNwcb8+ww70+Ony0GOyDYio3uO5/ZEi2oOYGw+tjxYtRflpfcnB6OiOmL4a3zF",
  render_errors: [view: SoPostTaskWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SoPostTask.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "qEcFRPwT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
