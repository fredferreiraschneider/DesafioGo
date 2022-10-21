# stage de build
FROM golang:1.19 AS build

WORKDIR /app

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o api 2main.go

# stage imagem final
FROM scratch

WORKDIR /app

COPY --from=build /app/api ./

#EXPOSE 8000

ENTRYPOINT [ "./api" ]