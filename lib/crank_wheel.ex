defmodule CrankWheel do
  alias CrankWheel.Client

  @user_agent [{"User-agent", "CrankWheel"}]

  @type response ::
          {:ok, :jsx.json_term(), HTTPoison.Response.t()}

  @spec get(binary, Client.t()) :: response
  @spec get(binary, Client.t(), keyword) :: response
  def get(path, client, headers \\ []) do
    _request(:get, path, client, nil, headers)
  end

  @spec get(binary, Client.t()) :: response
  @spec get(binary, Client.t(), keyword) :: response
  def post(path, client, headers \\ []) do
    _request(:post, path, client, nil, headers)
  end

  @spec get(binary, Client.t()) :: response
  @spec get(binary, Client.t(), keyword) :: response
  def patch(path, client, headers \\ []) do
    _request(:patch, path, client, nil, headers)
  end

  @spec get(binary, Client.t()) :: response
  @spec get(binary, Client.t(), keyword) :: response
  def delete(path, client, headers \\ []) do
    _request(:delete, path, client, nil, headers)
  end

  @spec _request(atom, binary, Client.t(), any, keyword) :: response | map
  def json_request() do
  end

  @spec _request(atom, binary, Client.t(), any, keyword) :: response | map
  def _request(http_method, path, client, body, headers) do
    response =
      HTTPoison.request(
        http_method,
        _url(client, path),
        body,
        headers ++ _authorization_header(client)
      )

    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: b}} ->
        b |> JSX.decode!()

      {:ok, %HTTPoison.Response{status_code: 201, body: b}} ->
        b |> JSX.decode!()

      {:ok, %HTTPoison.Response{status_code: 204, body: b}} ->
        b

      {:error, %HTTPoison.Error{reason: reason}} ->
        response
    end
  end

  @spec _url(Client.t(), binary) :: binary
  def _url(%Client{endpoint: endpoint}, path) do
    endpoint <> path
  end

  @spec _authorization_header(Client.t()) :: keyword
  def _authorization_header(%Client{api_key: api_key}) do
    [{"Authorization", "Basic #{api_key}"}]
  end
end
