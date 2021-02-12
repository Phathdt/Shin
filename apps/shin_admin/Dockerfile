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

# install shin admin
COPY apps/shin_api_admin/mix.exs ./apps/shin_api_admin/mix.exs
COPY apps/shin_admin/mix.exs ./apps/shin_admin/mix.exs
RUN mix do deps.get, deps.compile

# install shin admin FE dependencies
COPY apps/shin_admin/assets/package.json ./apps/shin_admin/assets/package.json
COPY apps/shin_admin/assets/yarn.lock ./apps/shin_admin/assets/yarn.lock
RUN cd apps/shin_admin/assets && yarn install && cd ../../..;

COPY apps/shin_core ./apps/shin_core
COPY apps/shin_api_admin ./apps/shin_api_admin
COPY apps/shin_admin ./apps/shin_admin
RUN cd apps/shin_admin/assets && yarn deploy && cd ../../..;
RUN cd apps/shin_admin mix do compile, phx.digest && cd ../..;
RUN mix release admin

FROM alpine:3.12 AS app
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
RUN chown nobody:nobody /app
USER nobody:nobody
COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/admin ./
ENV HOME=/app

EXPOSE 7000

CMD bin/admin start
