defmodule Example do
  use Application
  @y 10
  alias UUID

  def start(_type, _args) do
    IO.puts(UUID.uuid4())
    IO.puts(Example.hello())
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello do
    IO.puts(:world)
  end

  def main do
    x = 10
    IO.puts("Example output")
    IO.puts(x)
    IO.puts(@y)
    IO.puts(:hello)
    IO.puts(:"hello world")

    name = "Leonty"
    status = Enum.random([:gold, :silver, :bronze])

    if status === :gold do
      IO.puts("Welcome to fancy lounge #{name}")
    else
      IO.puts("Get lost")
    end
  end

end

Example.hello() # this line executes when the code is compiled
