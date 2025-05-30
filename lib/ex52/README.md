# Memo
## Server
### How to Run
```
$ mix run -e "Ex52.App.start(); :timer.sleep(:infinity)"
```
iex
```
$ iex -S mix
iex(1) > Ex52.App.start()
```

## Client
### How to Run
```
$ mix run -e "Ex52.Client.run()"
The current time is 16:03:54 UTC May 28 2025.
```
iex
```
iex(8)> Ex52.Client.run
The current time is 13:15:02 UTC May 28 2025.
```