
export GOPATH=$(shell pwd)
APPDIR=./src/tomkraljevic/twirpexample
PROTODIR=./proto
GENDIR=$(APPDIR)/rpc/haberdasher

default: build

get:
	go get -u github.com/twitchtv/twirp
	go get -u github.com/golang/protobuf/protoc-gen-go
	go get -u github.com/twitchtv/twirp/protoc-gen-twirp

build:
	protoc \
	    --twirp_out=$(APPDIR) \
	    --go_out=$(APPDIR) \
	    $(PROTODIR)/service.proto
	go build -o bin/client src/tomkraljevic/twirpexample/cmd/client/main.go
	go build -o bin/server src/tomkraljevic/twirpexample/cmd/server/main.go

clean:
	rm -f $(GENDIR)/service.twirp.go
	rm -f $(GENDIR)/service.pb.go
	rm -f bin/client
	rm -f bin/server

run:
	go run ./src/tomkraljevic/twirpexample/cmd/server/main.go


runclient:
	go run ./src/tomkraljevic/twirpexample/cmd/client/main.go

