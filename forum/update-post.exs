Mix.install([:req])

payload = %{
  post: %{
    title: "My first post updated",
    body: "Let me tell you about myself..."
  }
}

response =
  Req.patch!(
    "http://localhost:4000/api/posts/1",
    json: payload
  )

IO.inspect(response.body, pretty: true)
