defmodule TodoList do
  defstruct next_id: 1, entries: %{}

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      fn entry, todo_list_acc ->
        add_entry(todo_list_acc, entry)
      end
    )
  end

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

  def update_entry(%TodoList{entries: entries} = todo_list, entry_id, updater_fun) do
    case Map.fetch(entries, entry_id) do
      :error -> todo_list
      {:ok, old_entry} ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(%TodoList{entries: entries} = todo_list, entry_id) do
    new_entries = Map.delete(entries, entry_id)
    %TodoList{todo_list | entries: new_entries}
  end
end

todo_list =
  TodoList.new()
  |> TodoList.add_entry(%{date: ~D[2023-12-19], title: "Dentist"})
  |> TodoList.add_entry(%{date: ~D[2023-12-20], title: "Shopping"})
  |> TodoList.add_entry(%{date: ~D[2023-12-19], title: "Movies"})

todo_list = put_in(todo_list.entries[3].title, "Theater")

IO.inspect(TodoList.entries(todo_list, ~D[2023-12-19]))
