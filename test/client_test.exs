defmodule CrankWheel.ClientTest do
  use ExUnit.Case
  import CrankWheel.Client

  doctest CrankWheel.Client

  test "clients endpoint is configured" do
    client = new("API-KEY")
    assert client.endpoint == "https://example.is"
    assert client.api_key == "API-KEY"
  end
end
