Mix.install([:req])

response =
  Req.get!(
    "http://localhost:4000/api/posts"
  )

IO.inspect(response.body, pretty: true)
