# FbManagerOtp

Code based on "Intro to OTP In Elixir" (https://www.youtube.com/watch?v=CJT8wPnmjTM)

A small application wrapper for https://www.fantasyfootballnerd.com/. Uses the the ffnerd-api-elixir elixir API(https://github.com/jessejanderson/ffnerd-api-elixir). This application uses OTP for its process managment.

## Getting Started

Clone the repo locally
```sh
git clone https://github.com/mazz/fb_manager_otp.git
```

Get dependencies and compile dependencies
```sh
mix deps.get && mix deps.compile
```
Add compiled app to iex runtime
```sh
iex -S mix
```
IEX> Start the supervisor
```elixir
FbManagerOtp.Supervisor.start_link
```
IEX> Demonstrate that server is already running because of supervisor
```elixir
FbManagerOtp.Server.start_link # gets created when Supervisor does
```
IEX> Add some team members
```elixir
FbManagerOtp.Server.add("Russell Wilson")
FbManagerOtp.Server.add("Doug Baldwin")
```
IEX> Display fantasy team
```elixir
FbManagerOtp.Server.team
```
IEX> Remove a team member
```elixir
FbManagerOtp.Server.remove("Doug Baldwin")
```
IEX> Display fantasy team again
```elixir
FbManagerOtp.Server.team
```
IEX> Find elixir process by Atom
```elixir
Process.whereis(:fb_manager)
```
IEX> Kill server
```elixir
Process.whereis(:fb_manager) |> Process.exit(:kill)
```
IEX> Demonstrate that server is re-created by supervisor
```elixir
Process.whereis(:fb_manager)
```
Application initialization
In mix.exs, add application initialization
## mix.exs, add to `applications do`

|      mod: {FbManagerOtp.Application, []}

Run IEX again
```sh
iex -S mix
```
IEX> Demonstrate that we didn't need to call start_link because application already did
```elixir
FbManagerOtp.Server.add("Russell Wilson") # did not need to call start_link
```
IEX> Inspect the Erlang Runtime
```elixir
:observer.start
```
IEX> Add a player again
```elixir
FbManagerOtp.Server.add("Doug Baldwin")
```
IEX> Inspect the team
```elixir
FbManagerOtp.Server.team
```
IEX> Kill the server
```elixir
Process.whereis(:fb_manager) |> Process.exit(:kill)
```
IEX> See, the server got restarted, no state
```elixir
FbManagerOtp.Server.team
```

```sh
mix run --no-halt # run forever
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fb_manager_otp` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fb_manager_otp, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/fb_manager_otp](https://hexdocs.pm/fb_manager_otp).

