Mix.install([:req])
response =
  Req.delete!(
    "http://localhost:4000/api/posts/1"
  )

IO.inspect(response.body, pretty: true)
