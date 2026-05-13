Mix.install([:req])

payload = %{
  user: %{
    name: "Leonty",
    email: "leonty@email.com"
  }
}

response =
  Req.post!(
    "http://localhost:4000/api/users",
    json: payload
  )

IO.inspect(response.body, pretty: true)
