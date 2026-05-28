defmodule Math do
  def to_string(x) when is_atom(x) do
    Kernel.to_string(x)
  end

  def to_string(x) when is_number(x) do
    Kernel.to_string(x)
  end

  def to_string({:sum, x, y}) do
    "(" <> Math.to_string(x) <> " + " <> Math.to_string(y) <> ")"
  end

  def to_string({:mul, x, y}) do
    "(" <> Math.to_string(x) <> " * " <> Math.to_string(y) <> ")"
  end

  def diff(x, x) when is_atom(x) do
    1
  end

  def diff(v, x) when is_atom(v) and is_atom(x) do
    0
  end

  def diff(n, x) when is_number(n) and is_atom(x) do
    0
  end

  def diff({:sum, a, b}, x) when is_atom(x) do
    {:sum, diff(a, x), diff(b, x)}
  end

  def diff({:mul, a, b}, x) when is_atom(x) do
    {:sum, {:mul, diff(a, x), b}, {:mul, a, diff(b, x)}}
  end

  def eval(expr, values \\ [])

  def eval(a, _values) when is_number(a) do
    a
  end

  def eval(a, values) when is_atom(a) do
    Keyword.get(values, a, 0)
  end

  def eval({:sum, a, b}, values) do
    Math.eval(a, values) + Math.eval(b, values)
  end

  def eval({:mul, a, b}, values) do
    Math.eval(a, values) * Math.eval(b, values)
  end

  def subst(expr, values \\ [])

  def subst(a, _values) when is_number(a) do
    a
  end

  def subst(a, values) when is_atom(a) do
    Keyword.get(values, a, a)
  end

  def subst({:sum, a, b}, values) do
    {:sum, Math.subst(a, values), Math.subst(b, values)}
  end

  def subst({:mul, a, b}, values) do
    {:mul, Math.subst(a, values), Math.subst(b, values)}
  end

  def simplify({:sum, a, b}) do
    simplify_sum(simplify(a), simplify(b))
  end

  def simplify({:mul, a, b}) do
    simplify_mul(simplify(a), simplify(b))
  end

  def simplify(a) when is_number(a) when is_atom(a) do
    a
  end

  def simplify_sum(a, b) when is_number(a) and is_number(b), do: a + b
  def simplify_sum(a, 0), do: a
  def simplify_sum(0, b), do: b
  def simplify_sum(a, b), do: {:sum, a, b}

  def simplify_mul(a, b) when is_number(a) and is_number(b), do: a * b
  def simplify_mul(_a, 0), do: 0
  def simplify_mul(0, _b), do: 0
  def simplify_mul(a, 1), do: a
  def simplify_mul(1, b), do: b
  def simplify_mul(a, b), do: {:mul, a, b}

end

expr = {:mul, {:sum, {:mul, 3, :x}, :y}, 2}
values = [x: 1, y: 2]
substituted = Math.subst(expr, values)
dx = Math.diff(expr, :x)
dx_simplified = Math.simplify(dx)
IO.puts("#{Math.to_string(expr)} = #{Math.to_string(substituted)} = #{Math.eval(expr, values)}" )
IO.puts(Math.to_string(dx))
IO.puts(Math.to_string(dx_simplified))
