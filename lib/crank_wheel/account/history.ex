defmodule CrankWheel.Account.History do
  import CrankWheel
  alias CrankWheel.Client

  @path "/ss/api/demo_usage"

  def usage(client) do
    get(@path, client)
  end
end
