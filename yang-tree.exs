Mix.install([:jason])

defmodule YangTree do
  defp padding(indent) do
    String.duplicate("  ", indent)
  end

  def print_node(node, indent \\ 0)

  def print_node(
        %{
          name: name,
          type: "container",
          children: children
        },
        indent
      ) do
    IO.puts("#{padding(indent)}container #{name}")
    Enum.each(children, fn child -> print_node(child, indent + 1) end)
  end

  def print_node(
        %{
          name: name,
          type: "list",
          children: children,
          keys: keys
        },
        indent
      ) do
    IO.puts("#{padding(indent)}list #{name} keys #{keys}")
    Enum.each(children, fn child -> print_node(child, indent + 1) end)
  end

  def print_node(
        %{
          name: name,
          type: type,
          list: true
        },
        indent
      ) do
    IO.puts("#{padding(indent)}leaf-list #{name} type #{type}")
  end

  def print_node(
        %{
          name: name,
          type: type
        },
        indent
      ) do
    IO.puts("#{padding(indent)}leaf #{name} type #{type}")
  end

  def print_node(node, _indent) do
    IO.inspect(node, label: "unknown node")
  end
end

{:ok, content} = File.read("aaa.json")
{:ok, data} = Jason.decode(content, keys: :atoms)

# IO.inspect(data, pretty: true)

%{tree: nodes} = data
Enum.each(nodes, fn node -> YangTree.print_node(node) end)
