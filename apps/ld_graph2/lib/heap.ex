defmodule LdGraph2.Heap do
  @moduledoc """
  A pairing heap.
  """
  defstruct [root: 0, children: []]

  @doc """
  Joins two heaps together.
  """
  def meld(heap1, heap2) when heap1.root > heap2.root do
    %LdGraph2.Heap{root: heap1.root + 1, children: [heap1 | heap2.children]}
  end
  def meld(heap1, heap2) do
    %LdGraph2.Heap{root: heap2.root + 1, children: [heap2 | heap1.children]}
  end

  @doc """
  Inserts a value onto a heap.
  """
  def insert(heap) do
    meld(heap, %LdGraph2.Heap{root: heap.root, children: []})
  end

  @doc """
  Deletes the maximum (root) value of a heap.
  """
  def delete_max(heap) do
    merge_pairs(heap.children, %LdGraph2.Heap{})
  end

  def merge_pairs([head | tail], heap) do
    merge_pairs(tail, meld(head, heap))
  end
  def merge_pairs([], heap) do
    heap
  end
end