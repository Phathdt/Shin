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

# install shin client
COPY apps/shin_api_client/mix.exs ./apps/shin_api_client/mix.exs
COPY apps/shin_client/mix.exs ./apps/shin_client/mix.exs
RUN mix do deps.get, deps.compile

# install shin client FE dependencies
COPY apps/shin_client/assets/package.json ./apps/shin_client/assets/package.json
COPY apps/shin_client/assets/yarn.lock ./apps/shin_client/assets/yarn.lock
RUN cd apps/shin_client/assets && yarn install && cd ../../..;

COPY apps/shin_core ./apps/shin_core
COPY apps/shin_api_client ./apps/shin_api_client
COPY apps/shin_client ./apps/shin_client
RUN cd apps/shin_client/assets && yarn deploy && cd ../../..;
RUN cd apps/shin_client mix do compile, phx.digest && cd ../..;
RUN mix do compile, phx.digest, release client

FROM alpine:3.12 AS app
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
RUN chown nobody:nobody /app
USER nobody:nobody
COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/client ./
ENV HOME=/app

CMD bin/client start
