defmodule CrankWheel.Company.User do
  import CrankWheel
  alias CrankWheel.Client

  @path "/ss/api/user_access"

  @type create_body :: %{
          email: binary,
          privileg: binary,
          in_demo_pool: boolean,
          send_onboarding_email: boolean
        }

  @type update_body :: %{
          privileg: binary,
          in_demo_pool: boolean
        }

  @spec list(Client.t()) :: list
  def list(client) do
    get(@path, client)
  end

  @spec show(Client.t(), binary) :: map
  def show(client, email) do
    get("#{@path}/#{email}", client)
  end

  @spec create(Client.t(), create_body) :: map
  def create(client, body) do
    json = %{user_access: body} |> JSX.encode!()
    post(@path, client, json, [{"Content-Type", "application/json"}])
  end

  @spec update(Client.t(), update_body) :: map
  def update(client, body) do
    patch(@path, client, %{user_access: body}, [
      {"Content-Type", "application/x-www-form-urlencoded"}
    ])
  end

  @spec destroy(Client.t(), binary) :: map
  def destroy(client, email) do
    delete("#{@path}/#{email}", client)
  end
end
