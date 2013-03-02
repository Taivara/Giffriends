== Welcome to TRails

[![Build Status](https://magnum.travis-ci.com/Taivara/TRails.png?token=DY98q3WXgUtX5SM4wHkT)](http://magnum.travis-ci.com/Taivara/TRails)

Trails is Taivara's quick-start rails setup. (Taivara + Rails = Trails,
so clever, right?). The following describes what is contained in a default
setup as well as some general guidelines and best practices.

- Adds home controller and index route with tests
- Adds Flash messages display and checking in layout with tests
- Removes fixtures
- Adds certification environment
- Updates default database configuration for all environments
- Adds common .gitignore exclusions
- Adds Devise auth and signup as well as user model
- Adds i18n (internationalization) to views (devise-i18n-views gem used for
the Devise views)
- Adds version dependencies to all gems in gemfile
- Adds factory_girl_rails gem for fixtures
- Adds user fixture with sequenced emails
- Updates generator defaults to use factories and remove un-needed things
- Adds some default seed data for testing
- Adds common test helpers
- Adds omniauth gem
- Adds Facebook and Twitter login
- Adds code for resolving multiple authentications
- Adds controller for managing authentications
- Adds controller for managing users
- Adds roles table for tracking admins

Style Preferences:

- Use single quotes unless doing string interpolation
- Use Ruby 1.9 hash syntax; key: 'value' instead of the :key => 'value'
- Use factories to DRY up seed data


Misc.

By default devise views are not generated, if you want to generate them for
customization use rails g devise:views, remember to provide proper
internationalization for these views, you can grab the i18n versions of the
templates here: https://github.com/mcasimir/devise-i18n-views/tree/master/app/views/devise