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

# Creating the app
### Chapter 3 modifications
#### controllers, views, templates

1. command: mix phoenix.new vixet
    1. creates new project

2. command: mix ecto.create
    1. fix required: change Vixet.Repo in dev.exs
    2. command: mix ecto.create to change

3. change: /web/templates/page/index.html.eex
    1. remove old boilerplate
    2. change to project specific code

4. add: /web/models/user.ex
    1. defines fields for a user

5. change: /lib/vixet/repo.ex
    1. change @moduledoc text
    2. def all do end - creates all users for testing
    3. def get() do - defines "get a user by id"
    4. def get_by() do - defines "get a user by a custom attribute"

6. change: /lib/vixet.ex
    1. comment out supervisor line, stop the repository from starting.

7. change: /web/router.ex
    1. add route for /users
    2. add route for /users/:id

8. add: /web/controllers/user_controller.ex
    1. define index() function to show all users

9. add: /web/views/user_view.ex
    1. define first_name() function to parse first name

10. add: /web/templates/user/index.html.eex
    1. ^mostly html markup with some embedded elixir

11. verify: /web/web.ex
    1. verify the items being imported into the views

12. change: /web/controllers/user_controller.ex
    1. add show() function to show a single user

13. add: /web/templates/user/show.html.eex
    1. adding embedded elixir to render user by id  

14. verify: /web/views/error_view.ex
    1. verify error functions render()

15. verify: /web/templates/layout/app.html.eex
    1. verify alerts exist for errors from ^14
    2. also note this file can be edited for sweeping site layout changes.


### Chapter 4 modifications
### Ecto and changesets
##### ecto is a wrapper for relational databases

1. change: lib/vixet/repo.ex
    1. revert this file back to the created state (removing functions)

2. change: list/vixet.ex
    1. revert this file back to created state (remove commented-out line)

3. verify: command: mix ecto.create
    1. ^ this command creates the underlying database

4. change: web/models/user.ex
    1. this is schema change
    2. uses a DSL in ecto to define the data

5. command: mix ecto.gen.migration create_user
    1. MIGRATIONS!
    2. change the migration file to add the change() function

6. command: mix ecto.migrate
    1. ^ this runs the migration

7. change: web/controllers/user_controller.ex
    1. add reference to alias Vixet.User
    2. add new() function for new users
    3. changeset - lets Ecto manage record changes, cast parameters and perform validations.

8. change: web/models/user.ex
    1. add a changeset() function to validate length of username and cast params

9. change: web/router.ex
    1. delete the get user references
    2. add a resources line that shows common REST actions
    3. leaving resources as open would draw all four endpoints
    4. specifying "only:"" will only create the ones in brackets
    5. command: mix phoenix.routes to view all routes

10. add: web/templates/new.html.eex
    1. this will make the form for a new user
    2. use a helper function to build the form - this makes an anonymous function
    3. form_for provides UTF-8 encoding and security.

11. change: web/controllers/user_controller.ex
    1. add create() function - this creates the user entered in the ^ form
    2. also added a case function to cover error messages

12. change: web/templates/user/new.html.eex
    1. added error messages for the form validation in models/user.ex


### Chapter 5 modifications
### Authentication
#####

1. add: tool 'comeonin' for password hasing
    1. in mix.exs, add defp function to declare dependency
    2. add it to authentication/listings/vixet/mix.exs
    3. command: mix deps.get (this fetches dependencies)

2. change: web/models/user.ex
    1. add registration_changeset() function to validate passwords
    2. add put_pass_hash() (defp as private) to process function
    3. *** The book adds ALL users password_hash through a cli command at this point

3. change: web/controllers/user_controller.ex
    1. change create() to use User.registration_changeset()

4. create: web/controllers/auth.ex
    1. define module Vixet.auth
    2. import Plug.Conn
    3. define init()
    4. define call()

5. update: web/router.ex
    1. add a plug defined above to the router.ex

6. update: web/controllers/user_controller.ex
    1. add a private function authenticate()
    2. add options to the authenticate()
    3. update plug note in file

7. update: web/controllers/auth.ex
    1. add a login()

8. udpate: web/controllers/user_controller.ex
    1. update the create() to reference the auth.ex login()

9. update: web/router.ex
    1. add a route reference to SessionController

10. create: web/controllers/session_controller.ex
    1. add reference to Vixet.Web controller
    2. add a new() to render the login form
    3. add a create() to takes arguements to make a new session

11. update: web/controllers/auth.ex
    1. add a login_by_username_and_pass() to handle new func in session
    2. add import Comeonin.Bcrypt reference

12. add: web/views/session_view.ex
    1. define module for session view

13. add: web/templates/session/new.html.eex
    1. add template html.eex to make new form page

14. update: web/templages/layout/app.html.eex
    1. adding templating to show user login status

15. update: web/controllers/auth.ex
    1. add logout() to handle the session delete

16. update: web/controllers/session_controller.ex
    1. add delete() to handle the logout and delete session action
