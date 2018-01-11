defmodule UnionFind do
  @moduledoc """
  UnionFind is a data structure to manipulate disjoint-set.
  Complexity of operations is O(α(n)) (inverse Ackermann function) amortized.
  """

  defstruct [:tree]

  @doc """
  Returns a new union find struct. First, size of every sets is 1.

  ## Examples
  
      iex> uf = UnionFind.new(6)
      %UnionFind{tree: [-1, -1, -1, -1, -1, -1]}

  """
  def new(size), do: %UnionFind{tree: List.duplicate(-1, size)}
  
  @doc """
  If the sets that x and y belong to are distinct, the sets are combined.

  ## Examples

      iex> uf = UnionFind.new(6)
      %UnionFind{tree: [-1, -1, -1, -1, -1, -1]}
      iex> uf = uf |> UnionFind.unite(1, 4)
      %UnionFind{tree: [-1, -2, -1, -1, 1, -1]}

  """
  def unite(%UnionFind{tree: tree}, x, y) do
    x = root(tree, x)
    y = root(tree, y)
    tree = tree |> do_unite(x, y)
    %UnionFind{tree: tree}
  end
  
  defp do_unite(tree, x, y) when x == y, do: tree
  defp do_unite(tree, x, y) do
    {x, y} = if Enum.fetch!(tree, y) < Enum.fetch!(tree, x), do: {y, x}, else: {x, y}
    tree
    |> List.update_at(x, &(&1 + Enum.fetch!(tree, y)))
    |> List.replace_at(y, x)
  end
  
  @doc """
  Returns true if x and y belong to the same set.

  ## Examples
  
      iex> uf = UnionFind.new(6)
      %UnionFind{tree: [-1, -1, -1, -1, -1, -1]}
      iex> uf = uf |> UnionFind.unite(1, 4)
      %UnionFind{tree: [-1, -2, -1, -1, 1, -1]}
      iex> uf |> UnionFind.same?(1, 4)
      true
      iex> uf |> UnionFind.same?(1, 2)
      false

  """
  def same?(%UnionFind{tree: tree}, x, y) do
    root(tree, x) == root(tree, y)
  end
  
  @doc """
  Returns size of a set that x belong to.

  ## Examples

      iex> uf = UnionFind.new(6)
      %UnionFind{tree: [-1, -1, -1, -1, -1, -1]}
      iex> uf = uf |> UnionFind.unite(1, 4)
      %UnionFind{tree: [-1, -2, -1, -1, 1, -1]}
      iex> uf |> UnionFind.size(1)
      2
      iex> uf |> UnionFind.size(3)
      1
      
  """
  def size(%UnionFind{tree: tree}, x) do
    x = root(tree, x)
    tree |> Enum.fetch!(x) |> abs()
  end
  
  defp root(tree, current), do: root(tree, current, current)
  defp root(_tree, current, previous) when current < 0, do: previous
  defp root(tree, current, _previous), do: root(tree, Enum.fetch!(tree, current), current)
end



