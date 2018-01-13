FROM alpine:latest

COPY build/swain-go-linux-amd64 /usr/local/bin/swain-go
CMD ["/usr/local/bin/swain-go"]
