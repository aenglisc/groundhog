# Groundhog

This is a simple application for running scheduled daily tasks
Simply wrap your task in a zero-arity anonymous function and Bob's your uncle
Example: Groundhog.schedule(fn -> DateTime.utc_now end)

## Installation

```elixir
def deps do
  [
    {:groundhog, git: "https://github.com/aenglisc/groundhog.git"}
  ]
end
```

