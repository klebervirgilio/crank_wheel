defmodule CrankWheel.Client do
  defstruct endpoint: Application.fetch_env!(:crank_wheel, :api_endpoint),
            api_key: Application.get_env(:crank_wheel, :api_key)

  @type t :: %__MODULE__{api_key: binary, endpoint: binary}

  @spec new(binary) :: t()
  def new(api_key), do: %__MODULE__{api_key: api_key}
end
