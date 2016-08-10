case File.read file do
  {:ok, body} -> # do something with the body
  {:error, reason} -> # Handle the error caused by reason
end

# if you don't want to match on error out comes use #File.read which gives much
# more verbose errors. However they will not pattern match.
