FROM golang:1.23-bookworm AS builder

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /app/bot .

FROM alpine:3.21

RUN apk add --no-cache ca-certificates

COPY --from=builder /app/bot /app/bot

USER nobody

# main.go は os.Interrupt (SIGINT) のみ捕捉するため、stop 時に SIGINT を送る
STOPSIGNAL SIGINT

ENTRYPOINT ["/app/bot"]
