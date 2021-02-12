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

# install shin worker
COPY apps/shin_mailer/mix.exs ./apps/shin_mailer/mix.exs
COPY apps/shin_worker/mix.exs ./apps/shin_worker/mix.exs
RUN mix do deps.get, deps.compile

COPY apps/shin_core ./apps/shin_core
COPY apps/shin_mailer ./apps/shin_mailer
COPY apps/shin_worker ./apps/shin_worker
RUN cd apps/shin_worker mix do compile && cd ../..;
RUN mix release worker

FROM alpine:3.12 AS app
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
RUN chown nobody:nobody /app
USER nobody:nobody
COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/worker ./
ENV HOME=/app

CMD bin/worker start
