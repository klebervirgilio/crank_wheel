defmodule CrankWheel.Account.Demos do
  import CrankWheel

  @path "/ss/api/demo_usage"

  def usage(client) do
    get(@path, client)
  end
end
