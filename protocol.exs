defprotocol Blank do
  @doc "Returns true if data is considered blank/empty"
  def blank?(data)
end

# Integers are never blank
defimpl Blank, for: Integer do
  def blank?(_), do: false
end

# Just empty list is blank
defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_),  do: false
end

# Just empty map is blank
defimpl Blank, for: Map do
  # Keep in mind we could not pattern match on %{} because
  # it matches on all maps. We can however check if the size
  # is zero (and size is a fast operation).
  def blank?(map), do: map_size(map) == 0
end
# Even though Stucts are maps they do not share protocol implementations with
# maps. Each Struct you define will need it's own implementation of a protocol


# Just the atoms false and nil are blank
defimpl Blank, for: Atom do
  def blank?(false), do: true
  def blank?(nil),   do: true
  def blank?(_),     do: false
end

###############################################################################
#
# Any
# Elixir allows us to derive a protocol implementation based on the Any
# implementation
#
###############################################################################

defimpl Blank, for: Any do
  def blank?(_) do: false
end

# derive: opt-in
defmodule DeriveUser do
  @derive Blank # we derive the Blank protocol implementation provided my any
  defstruct name: "john", age: 27
end

# fallback_to_any: opt-out, all data types will fall back to Any implementation
# of Blank
defprotocol Blank do
  @fallback_to_any true
  def blank?(data)
end


  def blank?(_), do: false
end
