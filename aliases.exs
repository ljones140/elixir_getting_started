# Alias the module so it can be called as Bar instead of Foo.Bar
alias Foo.Bar, as: Bar

# Ensure the module is compiled and available (usually for macros)
require Foo

# Import functions from Foo so they can be called without the `Foo.` prefix
import Foo

# Invokes the custom code defined in Foo as an extension point
use Foo

defmodule Math do
  alias Math.List, as: List
end

List.flatten             # uses Math.List.flatten
Elixir.list.flatten      # uses List.flatten
Elixit.Math.List.flatten # uses Math.List.flatten

# Do not need to use the :as to define an alias (like SQL)
alias Math.List
# same as
alias Math.List, as: List
