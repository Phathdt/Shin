FROM shin_base:latest as build
COPY apps/shin_api_client/mix.exs ./apps/shin_api_client/mix.exs
COPY apps/shin_client/mix.exs ./apps/shin_client/mix.exs
RUN mix do deps.get, deps.compile

FROM build as build-backend
COPY apps/shin_core ./apps/shin_core
COPY apps/shin_api_client ./apps/shin_api_client
COPY apps/shin_client/config ./apps/shin_client/config
COPY apps/shin_client/lib ./apps/shin_client/lib
COPY apps/shin_client/mix.exs ./apps/shin_client/mix.exs
RUN cd apps/shin_client mix do compile

FROM build as build-frontend
WORKDIR /app/apps/shin_client/assets
COPY apps/shin_client/assets/package.json ./
COPY apps/shin_client/assets/yarn.lock ./yarn.lock
RUN yarn install
COPY apps/shin_client/assets/ ./
RUN yarn deploy
RUN ls -lha
# RUN cd apps/shin_client/assets && yarn deploy

FROM build-backend as build-final
COPY --from=build-frontend --chown=nobody:nobody /app/apps/shin_client/assets ./apps/shin_client/assets
RUN cd apps/shin_client && mix do compile, phx.digest && cd ../..;
RUN mix release client

FROM alpine:3.12
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
RUN chown nobody:nobody /app
USER nobody:nobody
COPY --from=build-final --chown=nobody:nobody /app/_build/prod/rel/client ./
ENV HOME=/app

EXPOSE 6000
CMD bin/client start
