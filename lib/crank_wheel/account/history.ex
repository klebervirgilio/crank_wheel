defmodule CrankWheel.Account.History do
  import CrankWheel

  @path "/ss/api/usage"

  def usage(client) do
    get(@path, client)
  end
end
