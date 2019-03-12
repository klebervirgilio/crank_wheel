defmodule CrankWheel.Sessions do
  import CrankWheel
  alias CrankWheel.Client

  @schedule_meeting_path "/ss/api/schedule_meeting"
  @type meeting_body :: %{email: binary, name: binary}

  @noauth_link_path "/ss/api/make_noauth_link"
  @type noauth_link_body :: %{email: binary, within_seconds: integer}

  @spec schedule(Client.t(), meeting_body) :: map
  def schedule(client, body) do
    {:ok, json} = JSX.encode(body)
    post(@schedule_meeting_path, client, json, [{"Content-Type", "application/json"}])
  end

  @spec create_noauth_link(Client.t(), noauth_link_body) :: map
  def create_noauth_link(client, body) do
    {:ok, json} = JSX.encode(body)
    post(@noauth_link_path, client, json, [{"Content-Type", "application/json"}])
  end
end
