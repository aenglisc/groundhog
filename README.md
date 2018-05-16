# Groundhog

This is a simple application for running scheduled daily tasks.

Simply wrap your task in a zero-arity anonymous function and Bob's your uncle!

Example:
```elixir
Groundhog.schedule(fn -> IO.puts "Then put your little hand in mine..." end)
```

## Installation

```elixir
def deps do
  [
    {:groundhog, git: "https://github.com/aenglisc/groundhog.git"}
  ]
end
```

