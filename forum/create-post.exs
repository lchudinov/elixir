Mix.install([:req])

payload = %{
  post: %{
    title: "My first post",
    body: "Let me tell you about myself..."
  }
}

response =
  Req.post!(
    "http://localhost:4000/api/posts",
    json: payload
  )

IO.inspect(response.body, pretty: true)
