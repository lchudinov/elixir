defmodule Example do
  use Application

  alias UUID

  def start(_type, _args) do
    IO.puts(UUID.uuid4())
    IO.puts(Example.hello())
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello do
    IO.puts(:world)
  end

end

Example.hello() # this line executes when the code is compiled
