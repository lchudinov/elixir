Mix.install([:req])

[name] = System.argv()

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
