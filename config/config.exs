# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :crank_wheel,
  api_endpoint: "https://meeting.is",
  api_key: System.get_env("CRANK_WHEEL_API_KEY")

import_config "#{Mix.env()}.exs"
