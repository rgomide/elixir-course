# Channel Spike

# Running locally

This project is dockerized for development. The `docker-compose.yml` uses three images: (1) elixir server, (2) postgres database and (3) pgAdmin.

Main `docker-compose` commands:

  * Run project: `docker-compose up`;
  * Execute dataseed: `docker-compose run channelspike_web mix run priv/repo/seeds.exs`.

The application can be accessed on http://localhost:4000 and pgAdmin interface on http://localhost:5050. The pgAdmin email is `admin@admin.com` and password is `root`.

Sometimes docker will be full of images. This is the command to clean everything: `docker images -a | grep ".*" | awk '{print $3}' | xargs docker rmi --force; docker volume rm $(docker volume ls -qf dangling=true)`

# Testing

To run tests, make sure that containers are running. You can run `docker-compose up` or `docker-compose up -d` before execute the tests.

Test commands:

  * Run all tests: `docker-compose run -e MIX_ENV=test channelspike_web mix test`;
  * Run all tests in a given directory (e.g. `test/discuss_web/views`): `docker-compose run -e MIX_ENV=test channelspike_web mix test ./test/discuss_web/views/`;

## References

  * Official documentation: https://hexdocs.pm/phoenix/testing.html

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
ßß