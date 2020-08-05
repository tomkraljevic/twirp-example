package main

import (
    "net/http"

    "tomkraljevic/twirpexample/internal/haberdasherserver"
    "tomkraljevic/twirpexample/rpc/haberdasher"
)

func main() {
  server := &haberdasherserver.Server{} // implements Haberdasher interface
  twirpHandler := haberdasher.NewHaberdasherServer(server, nil)

  http.ListenAndServe(":8080", twirpHandler)
}
