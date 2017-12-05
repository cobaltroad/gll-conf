# README

The GLL Conference app is a sandbox/demo app running Rails 5.1.4 as well as React via Webpacker.

Gems are managed via Bundler.

    gem install bundler
    bundle install

The Rails server operates as the backend API server.  React components communicate with the backend
via a client.  `config/webpacker.yml` shows where the API proxy is mapped.
In the development/local environment, this is mapped to `http://localhost:3000`

In order to start the server for this configuration, first start the backend

    rails server --port 3000

and then run the webpack server

    ./bin/webpack-dev-server

# HEROKU

The app is also able to be deployed onto Heroku which manages all of the services.  It can be accessed at

    https://gll-conf.herokuapp.com/

A test user has already been added, but all functionality (including registration) is available.  One
could log in with the credentials `foo@bar.com` and password `foo`
