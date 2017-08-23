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

3. update /web/templates/page/index.html.eex
    1. remove old boilerplate
    2. update to project specific code

4. add /web/models/user.ex
    1. defines fields for a user

5. update /lib/vixet/repo.ex
    1. update @moduledoc text
    2. def all do end - creates all users for testing
    3. def get() do - defines "get a user by id"
    4. def get_by() do - defines "get a user by a custom attribute"

6. update /lib/vixet.ex
    1. comment out supervisor line, stop the repository from starting.

7. update /web/router.ex
    1. add route for /users
    2. add route for /users/:id

8. add /web/controllers/user_controller.ex
    1. define index() function to show all users

9. add /web/views/user_view.ex
    1. define first_name() function to parse first name

10. add /web/templates/user/index.html.eex
    1. ^mostly html markup with some embedded elixir
    2.
