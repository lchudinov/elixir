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
    IO.inspect(response.body, pretty: true)

  {:error, exception} ->
    IO.puts(:stderr, "Request failed:")
    IO.inspect(exception, pretty: true)
end
