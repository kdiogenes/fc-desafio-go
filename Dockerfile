FROM golang:1.19
WORKDIR /usr/src/app
COPY . .
RUN go build -v -o /usr/local/bin/app ./hello-world.go

FROM scratch
WORKDIR /root/
COPY --from=0 /usr/local/bin/app ./
CMD ["./app"]