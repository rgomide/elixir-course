# Channel Spike

# Running locally

This project is dockerized for development. The `docker-compose.yml` uses three images: (1) elixir server, (2) postgres database and (3) pgAdmin.

Main `docker-compose` commands:

  * Run project: `docker-compose up`;
  * Execute dataseed: `docker-compose run channelspike_web mix run priv/repo/seeds.exs`.

The application can be accessed on https://localhost:4000 and pgAdmin interface on https://localhost:5050. The pgAdmin email is `admin@admin.com` and password is `root`.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
