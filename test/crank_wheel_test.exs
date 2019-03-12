defmodule CrankWheelTest do
  use ExUnit.Case
  doctest CrankWheel

  test "build api url" do
    assert CrankWheel._url(%CrankWheel.Client{endpoint: "http://example.com"}, "/path") ==
             "http://example.com/path"
  end

  test "build authorization header" do
    assert CrankWheel._headers(%CrankWheel.Client{api_key: "key"}) ==
             [{"Authorization", "Basic key"}, {"User-agent", "CrankWheel"}]
  end
end
