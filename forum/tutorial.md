# Commands for Phoenix

`mix local.hex`
`mix archive.install hex phx_new`
`mix phx.new forum --database sqlite3`

We are almost there! The following steps are missing:

  `cd forum`

Then configure your database in config/dev.exs and run:

  `mix ecto.create`

Start your Phoenix app with:

  `mix phx.server`

You can also run your app inside IEx (Interactive Elixir) as:

  `iex -S mix phx.server`
  
Create a Post Controller
`mix phx.gen.json Posts Post posts body:string title:string`
then add to a router manually, and then run,
`mix ecto.migrate`


`mix phx.routes` - List of routes


`mix phx.gen.json Accounts User users name:string email:string:unique`
