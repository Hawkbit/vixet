# Vixet

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Creating the app

1. mix phoenix.new vixet
    1. creates new project
2. mix ecto.create
    1. fix required: update Vixet.Repo in dev.exs
    2. run mix ecto.create again
3. update web/templates/page/index.html.eex
    1. remove old boilerplate
    2. update to project specific code
4. add web/models/user.ex
    1. defines fields for a user
5. update lib/vixet/repo.ex
