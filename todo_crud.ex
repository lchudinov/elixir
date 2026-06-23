defmodule TodoList do
  defstruct next_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(%TodoList{entries: entries, next_id: next_id} = todo_list, entry) do
    entry = Map.put(entry, :id, next_id)
    new_entries = Map.put(entries, next_id, entry)
    %TodoList{todo_list | entries: new_entries, next_id: next_id + 1}
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Map.values()
    |> Enum.filter(fn entry -> entry.date == date end)
  end
end

todo_list =
  TodoList.new()
  |> TodoList.add_entry(%{date: ~D[2023-12-19], title: "Dentist"})
  |> TodoList.add_entry(%{date: ~D[2023-12-20], title: "Shopping"})
  |> TodoList.add_entry(%{date: ~D[2023-12-19], title: "Movies"})

IO.inspect(TodoList.entries(todo_list, ~D[2023-12-19]))
