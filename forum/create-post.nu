let payload = ({
  post: {
    title: "My first post"
    body: "Let me tell you about myself..."
  }
} | to json)

let response: record = (http post -k --content-type application/json http://localhost:4000/api/posts $payload)
$response | table -e