defmodule UnionFindTest do
  use ExUnit.Case

  test "union find" do
    uf = UnionFind.new(6)
    assert uf.tree == [-1, -1, -1, -1, -1, -1]
    uf = uf |> UnionFind.unite(1, 4)
    uf = uf |> UnionFind.unite(2, 3)
    assert UnionFind.same?(uf, 1, 4) == true
    assert UnionFind.same?(uf, 1, 2) == false
    assert UnionFind.size(uf, 1) == 2
    assert UnionFind.size(uf, 5) == 1
  end
end
