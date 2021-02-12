FROM bitwalker/alpine-elixir-phoenix:1.10.3 AS build

# install build dependencies
RUN apk add --no-cache yarn

ENV MIX_ENV=prod
WORKDIR /app

# install shin core
COPY mix.exs mix.lock ./
COPY config config
COPY apps/shin_core/mix.exs ./apps/shin_core/mix.exs
RUN mix do deps.get, deps.compile
