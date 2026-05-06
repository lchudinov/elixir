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
