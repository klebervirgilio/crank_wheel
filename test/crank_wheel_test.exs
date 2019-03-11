defmodule CrankWheelTest do
  use ExUnit.Case
  doctest CrankWheel

  import Mock
  import CrankWheel
  alias CrankWheel.Client

  test "build api url" do
    assert _url(%CrankWheel.Client{endpoint: "http://example.com"}, "/path") ==
             "http://example.com/path"
  end

  test "build authorization header" do
    assert _authorization_header(%CrankWheel.Client{api_key: "key"}) ==
             [{"Authorization", "Basic key"}]
  end
end
