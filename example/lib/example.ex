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

    case status do
      :gold -> IO.puts("you have status of gold")
      :silver -> IO.puts("you have status of silver")
      :bronze -> IO.puts("you have status of bronze")
      _ -> IO.puts("you are not a member")
    end

    IO.puts("This\na\nmessage\n")
    IO.puts("After")
    IO.puts(?a)
    IO.puts(?Л)

    a = 10
    b = 3.0
    IO.puts(a + b)
    :io.format("~.20f\n", [a / b])
    IO.puts(Float.ceil(1.234, 1))
    IO.puts(Integer.gcd(9, 27))
  end

end

Example.hello() # this line executes when the code is compiled
