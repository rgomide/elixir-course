FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

COPY mix.exs .
COPY mix.lock .
RUN mix deps.get 
RUN mix deps.compile

CMD mix deps.get && mix phx.server