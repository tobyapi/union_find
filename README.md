# UnionFind
[![CircleCI](https://circleci.com/gh/TobiasGSmollett/union_find.svg?style=svg)](https://circleci.com/gh/TobiasGSmollett/union_find)

UnionFind is a data structure to manipulate disjoint-set.
Complexity of operations is O(α(n)) (inverse Ackermann function) amortized.

## Usage

```elixir
uf = UnionFind.new(6)
uf = uf |> UnionFind.unite(1, 4)

UnionFind.same?(uf, 1, 4) # => true
UnionFind.same?(uf, 1, 2) # => false

UnionFind.size(uf, 1) # => 2
UnionFind.size(uf, 5) # => 1
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `union_find` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:union_find, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/union_find](https://hexdocs.pm/union_find).

