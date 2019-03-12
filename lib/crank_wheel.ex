defmodule CrankWheel do
  alias CrankWheel.Client

  @user_agent [{"User-agent", "CrankWheel"}]

  @type response ::
          {:ok, :jsx.json_term(), HTTPoison.Response.t()}

  @spec get(binary, Client.t()) :: response
  @spec get(binary, Client.t(), keyword) :: response
  def get(path, client, headers \\ []) do
    _request(:get, path, client, "", headers)
  end

  @spec post(binary, Client.t(), any) :: response
  @spec post(binary, Client.t(), any, keyword) :: response
  def post(path, client, body, headers \\ []) do
    _request(:post, path, client, body, headers)
  end

  @spec patch(binary, Client.t(), any) :: response
  @spec patch(binary, Client.t(), any, keyword) :: response
  def patch(path, client, body, headers \\ []) do
    _request(:patch, path, client, body, headers)
  end

  @spec delete(binary, Client.t()) :: response
  @spec delete(binary, Client.t(), keyword) :: response
  def delete(path, client, headers \\ []) do
    _request(:delete, path, client, "", headers)
  end

  @spec _request(atom, binary, Client.t(), any, keyword) :: response | map
  def _request(http_method, path, client, body, headers) do
    response =
      HTTPoison.request(
        http_method,
        _url(client, path),
        body,
        headers ++ _headers(client)
      )

    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: b}} ->
        b |> JSX.decode!()

      {:ok, %HTTPoison.Response{status_code: 201, body: b}} ->
        b |> JSX.decode!()

      {:ok, %HTTPoison.Response{status_code: 204, body: b}} ->
        b |> JSX.decode!()

      {:ok, %HTTPoison.Response{status_code: 404, body: b}} ->
        b |> JSX.decode!()

      {:ok, %HTTPoison.Response{status_code: 500, body: b}} ->
        b |> JSX.decode!()

      {:error, _} ->
        response
    end
  end

  @spec _url(Client.t(), binary) :: binary
  def _url(%Client{endpoint: endpoint}, path) do
    endpoint <> path
  end

  @spec _headers(Client.t()) :: keyword
  def _headers(%Client{api_key: api_key}) do
    [{"Authorization", "Basic #{api_key}"}] ++ @user_agent
  end
end
