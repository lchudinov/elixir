Mix.install([:req])

name =
  case System.argv() do
    [name] -> name
    _ ->
      IO.puts("Usage:")
      IO.puts("  elixir create-user.exs <name>")
      System.halt(1)
  end

payload = %{
  user: %{
    name: name,
    email: "#{String.downcase(name)}@email.com"
  }
}

response =
  Req.post!(
    "http://localhost:4000/api/users",
    json: payload
  )

IO.inspect(response.body, pretty: true)
