defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  use Application
  @y 10
  alias UUID

  @spec start(any(), any()) :: none()
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
    IO.puts("This is a tutorial https://www.youtube.com/watch?v=-lgtb-YSUWE")
  end

  def tutorial do
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

    time = Time.new!(16, 30, 0, 0)
    {:ok, date} = Date.new(2026, 5, 5)
    {:ok, date_time} = DateTime.new(date, time, "Etc/UTC")
    IO.inspect(time)
    IO.inspect(date)
    IO.inspect(date_time)

    time_to_new_year()
    tuples()
    lists_and_loops()
    maps()
    structs()
  end

  def time_to_new_year do
    time = DateTime.new!(Date.new!(2027, 1, 1), Time.new!(0, 0, 0, 0), "Etc/UTC")
    time_till = DateTime.diff(time, DateTime.utc_now())
    IO.puts(time_till)
    days = div(time_till, 86_400)
    hours = div(rem(time_till, 86_400), 3600)
    minutes = div(rem(rem(time_till, 86_400), 3600), 60)
    seconds = rem(rem(rem(time_till, 86_400), 3600), 60)

    IO.puts(
      "Time until New Year #{days} days #{hours} hours #{minutes} minutes #{seconds} seconds"
    )
  end

  def tuples do
    memberships = {:bronze, :silver}
    memberships = Tuple.append(memberships, :bronze)
    IO.inspect(memberships)

    prices = {5, 10, 15}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts("Average price: #{avg}")

    IO.puts(
      "Average price from #{elem(memberships, 0)} #{elem(memberships, 1)} #{elem(memberships, 2)} is #{avg}"
    )

    user1 = {"Leonty", :gold}
    user2 = {"Civic", :gold}
    user3 = {"Kathy", :silver}

    {name, membership} = user1
    IO.puts("#{name} has a #{membership} membership")
    {name, membership} = user2
    IO.puts("#{name} has a #{membership} membership")
    {name, membership} = user3
    IO.puts("#{name} has a #{membership} membership")
  end

  def lists_and_loops do
    users = [{"Leonty", :gold}, {"Civic", :gold}, {"Kathy", :silver}, {"John", :gold}]

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} has a #{membership} membership")
    end)
  end

  def maps do
    memeberships = %{
      gold: :gold,
      silver: :silver,
      bronze: :bronze,
      none: :none
    }

    prices = %{
      gold: 25,
      silver: 20,
      bronze: 10,
      none: 0
    }

    users = [
      {"Leonty", memeberships.gold},
      {"Civic", memeberships.gold},
      {"Kathy", memeberships.silver},
      {"John", memeberships.gold}
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} has a #{membership} membership paying #{prices[membership]}")
    end)
  end

  def structs do
    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 20}
    bronze_membership = %Membership{type: :bronze, price: 15}
    none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: "Leonty", membership: gold_membership},
      %User{name: "Civic", membership: gold_membership},
      %User{name: "Kathy", membership: silver_membership},
      %User{name: "John", membership: bronze_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership paying #{membership.price}")
    end)
  end

  def guess_game do
    correct = :rand.uniform(11) - 1
    guess = IO.gets("Guess a number between 0 and 10: ") |> String.trim() |> Integer.parse()

    case guess do
      {result, ""} ->
        IO.puts("parse successful #{result}")

        if result === correct do
          IO.puts("You win!")
        else
          IO.puts("You lose!")
        end

      {result, other} ->
        IO.puts("parse partially successful #{result} rest: #{other}")

      :error ->
        IO.puts("Something went wrong")
    end
  end
end

# this line executes when the code is compiled
Example.hello()
