FROM shin_base:latest as build
COPY apps/shin_api_admin/mix.exs ./apps/shin_api_admin/mix.exs
COPY apps/shin_admin/mix.exs ./apps/shin_admin/mix.exs
RUN mix do deps.get, deps.compile

FROM build as build-backend
COPY apps/shin_core ./apps/shin_core
COPY apps/shin_api_admin ./apps/shin_api_admin
COPY apps/shin_admin/config ./apps/shin_admin/config
COPY apps/shin_admin/lib ./apps/shin_admin/lib
COPY apps/shin_admin/mix.exs ./apps/shin_admin/mix.exs
RUN cd apps/shin_admin mix do compile

FROM build as build-frontend
WORKDIR /app/apps/shin_admin/assets
COPY apps/shin_admin/assets/package.json ./
COPY apps/shin_admin/assets/yarn.lock ./yarn.lock
RUN yarn install
COPY apps/shin_admin/assets/ ./
RUN yarn deploy

FROM build-backend as build-final
COPY --from=build-frontend --chown=nobody:nobody /app/apps/shin_admin/assets ./apps/shin_admin/assets
COPY --from=build-frontend --chown=nobody:nobody /app/apps/shin_admin/priv ./apps/shin_admin/priv
RUN cd apps/shin_admin && mix do compile, phx.digest && cd ../..;
RUN mix release admin

FROM alpine:3.12
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
RUN chown nobody:nobody /app
USER nobody:nobody
COPY --from=build-final --chown=nobody:nobody /app/_build/prod/rel/admin ./
ENV HOME=/app
EXPOSE 7000
CMD bin/admin eval "ShinCore.Release.migrate" && bin/admin start
