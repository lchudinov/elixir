Mix.install([:req])

script_name = __ENV__.file |> Path.basename()

name =
  case System.argv() do
    [name] -> name
    _ ->
      IO.puts("Usage:")
      IO.puts("  elixir #{script_name} <name>")
      System.halt(1)
  end

payload = %{
  user: %{
    name: name,
    email: "#{String.downcase(name)}@email.com"
  }
}

case Req.post(
    "http://localhost:4000/api/users",
    json: payload
) do
  {:ok, response} ->
    case response do
      %{status: 201, body: body} ->
        IO.inspect(body, pretty: true, label: "Response")
      %{status: status, body: body} ->
        IO.inspect(body, label: "HTTP error #{status}")
    end

  {:error, exception} ->
    IO.inspect(exception, pretty: true, label: "Request failed")
end
